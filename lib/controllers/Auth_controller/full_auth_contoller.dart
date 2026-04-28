import 'package:ai_gernator_outfits/features/navigation/screen/Navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SignemailController= TextEditingController();
  final SignpasswordController=TextEditingController();
  final signupNameController=TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  final formKey = GlobalKey<FormState>();
  final Signformkey= GlobalKey<FormState>();
  var isLoading = false.obs;

  Future<void> login() async {
    // ✅ Check if form exists
    if (formKey.currentState == null) {
      Get.snackbar("Error", "Form not initialized");
      return;
    }

    // ✅ Validate form correctly
    if (!formKey.currentState!.validate()) {
      return; // stop if invalid
    }

    // ✅ Extra safety (avoid empty values)
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Email and Password required");
      return;
    }

    try {
      isLoading.value = true;

      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ✅ Success
      Get.offAll(() => const MainNavigationShell());

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Failed", e.message ?? "Authentication error");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize(
        serverClientId: dotenv.get('ServerClientId'), // 🔥 IMPORTANT
      );

      final account = await _googleSignIn.authenticate();

      final auth = account.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: auth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

    } catch (e) {
      print("Google Login Error: $e");
    }
  }

  Future<void> signup() async {
    if (Signformkey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: SignemailController.text.trim(),
        password: SignpasswordController.text.trim(),
      );

      await FirebaseAuth.instance.currentUser
          ?.updateDisplayName(signupNameController.text.trim());


      Get.snackbar("Success", "Account created successfully");

      // Navigate to home or login
      Get.offAll(() => const MainNavigationShell());

    } on FirebaseAuthException catch (e) {
      Get.snackbar("Signup Failed", e.message ?? "Error");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}