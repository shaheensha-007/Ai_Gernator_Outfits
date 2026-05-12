import 'package:flutter/material.dart';

class AadhaarDetailsScreen extends StatelessWidget {
  final String uid;
  final String name;
  final String gender;
  final String yob;
  final String address;

  const AadhaarDetailsScreen({
    Key? key,
    required this.uid,
    required this.name,
    required this.gender,
    required this.yob,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Aadhaar Details'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      Icon(Icons.verified_user, size: 70, color: Colors.green),
                      SizedBox(height: 8),
                      Text(
                        "Verified Aadhaar",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Details Rows
                _buildInfoRow('Aadhaar Number', _maskUID(uid), Icons.credit_card),
                const Divider(height: 30),

                _buildInfoRow('Full Name', name, Icons.person),
                const Divider(height: 30),

                _buildInfoRow(
                    'Gender',
                    gender == 'M' ? 'Male' : (gender == 'F' ? 'Female' : gender),
                    Icons.wc
                ),
                const Divider(height: 30),

                _buildInfoRow('Year of Birth', yob, Icons.cake),
                const Divider(height: 30),

                _buildInfoRow('Address', address, Icons.home),

                const SizedBox(height: 32),

                // Button to scan again
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.qr_code_scanner),
                    label: const Text(
                      'Scan Another Aadhaar',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // Go back to the scanner
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to format the text rows nicely with an icon
  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blueAccent, size: 28),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper method to mask the UID for privacy (e.g., XXXX XXXX 1234)
  String _maskUID(String uid) {
    if (uid.length == 12) {
      return "XXXX XXXX ${uid.substring(8)}";
    }
    return uid; // Return as-is if it's not a standard 12-digit format
  }
}