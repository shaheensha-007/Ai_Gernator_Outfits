import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:xml/xml.dart' as xml;

import 'aadhaar_detalis.dart'; // Make sure this matches your file name

class AadhaarScannerScreen extends StatefulWidget {
  @override
  _AadhaarScannerScreenState createState() => _AadhaarScannerScreenState();
}

class _AadhaarScannerScreenState extends State<AadhaarScannerScreen> {
  String scannedData = "Scan an Aadhaar QR Code";
  bool isProcessing = false;

  // ----------------------------------------------------------------------
  // THIS IS THE GOOGLE ML KIT CONFIGURATION
  // We force ML Kit to ONLY scan for QR codes. This makes it significantly
  // faster and more accurate for dense Aadhaar codes.
  // ----------------------------------------------------------------------
  final MobileScannerController mlKitController = MobileScannerController(
    formats: const [BarcodeFormat.qrCode], // Force QR Code only
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  @override
  void dispose() {
    mlKitController.dispose(); // Always dispose to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aadhaar Scanner')),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: MobileScanner(
              controller: mlKitController, // APPLY THE ML KIT CONTROLLER HERE
              onDetect: (capture) {
                if (isProcessing) return;

                final List<Barcode> barcodes = capture.barcodes;
                for (final barcode in barcodes) {
                  if (barcode.rawValue != null) {
                    setState(() {
                      isProcessing = true;
                      scannedData = "Processing...";
                    });
                    _processAadhaarQR(barcode.rawValue!);
                    break;
                  }
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Text(
                scannedData,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _processAadhaarQR(String rawValue) {
    try {
      if (rawValue.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(rawValue)) {
        setState(() {
          scannedData = "Invalid QR: Not a numeric Aadhaar format.";
          isProcessing = false;
        });
        return;
      }

      BigInt bigIntData = BigInt.parse(rawValue);

      String hexString = bigIntData.toRadixString(16);
      if (hexString.length % 2 != 0) {
        hexString = '0' + hexString;
      }

      List<int> bytes = [];
      for (int i = 0; i < hexString.length; i += 2) {
        bytes.add(int.parse(hexString.substring(i, i + 2), radix: 16));
      }

      int startIndex = -1;
      for (int i = 0; i < bytes.length - 1; i++) {
        if (bytes[i] == 120 && (bytes[i + 1] == 156 || bytes[i + 1] == 218)) {
          startIndex = i;
          break;
        }
      }

      if (startIndex == -1) {
        throw Exception("Could not find Zlib header. This may not be a valid Secure Aadhaar QR.");
      }

      List<int> compressedPayload = bytes.sublist(startIndex);
      List<int> decompressedBytes = zlib.decode(compressedPayload);

      String decodedString = latin1.decode(decompressedBytes);

      // Clean up the string for newer Aadhaar cards that have hidden characters
      int xmlStartIndex = decodedString.indexOf('<?xml');
      if (xmlStartIndex == -1) {
        xmlStartIndex = decodedString.indexOf('<PrintLetterBarcodeData');
      }
      if (xmlStartIndex != -1 && xmlStartIndex > 0) {
        decodedString = decodedString.substring(xmlStartIndex);
      }

      final document = xml.XmlDocument.parse(decodedString);
      final element = document.findElements('PrintLetterBarcodeData').first;

      String uid = element.getAttribute('uid') ?? 'N/A';
      String name = element.getAttribute('name') ?? 'N/A';
      String gender = element.getAttribute('gender') ?? 'N/A';
      String yob = element.getAttribute('yob') ?? 'N/A';

      String co = element.getAttribute('co') ?? '';
      String house = element.getAttribute('house') ?? '';
      String loc = element.getAttribute('loc') ?? '';
      String dist = element.getAttribute('dist') ?? '';
      String state = element.getAttribute('state') ?? '';
      String pc = element.getAttribute('pc') ?? '';

      String fullAddress = [co, house, loc, dist, state, pc].where((e) => e.isNotEmpty).join(', ');

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AadhaarDetailsScreen(
              uid: uid,
              name: name,
              gender: gender,
              yob: yob,
              address: fullAddress,
            ),
          ),
        );
      }

    } catch (e) {
      print("Aadhaar Decode Exception: $e");
      setState(() {
        scannedData = "Failed to parse: $e";
        isProcessing = false;
      });
    }
  }
}