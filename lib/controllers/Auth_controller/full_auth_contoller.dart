import 'package:ai_gernator_outfits/features/navigation/screen/Navigation_bar.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/Login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final SignemailController = TextEditingController();
  final SignpasswordController = TextEditingController();
  final signupNameController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  final formKey = GlobalKey<FormState>();
  final Signformkey = GlobalKey<FormState>();
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

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', emailController.text.trim());
      await prefs.setString(
        'username',
        _auth.currentUser?.displayName ?? 'User',
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
      isLoading.value = true;

      // ✅ Initialize Google Sign-In
      await _googleSignIn.initialize(
        serverClientId: dotenv.env['ServerClientId'],
      );

      // ✅ Start Sign In
      final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

      // ✅ Get Tokens
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // ✅ Check ID Token
      if (googleAuth.idToken == null) {
        Get.snackbar(
          "Login Failed",
          "Unable to get Google ID Token",
        );
        return;
      }

      // ✅ Firebase Credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // ✅ Firebase Login
      UserCredential userCredential =
      await FirebaseAuth.instance
          .signInWithCredential(credential);

      // ✅ User Data
      User? user = userCredential.user;

      print("User Name: ${user?.displayName}");
      print("User Email: ${user?.email}");

      // ✅ Navigate
      Get.offAll(() => const MainNavigationShell());

    } on FirebaseAuthException catch (e) {

      Get.snackbar(
        "Firebase Error",
        e.message ?? "Unknown Error",
      );

    } catch (e) {

      print("Google Login Error: $e");

      Get.snackbar(
        "Google Sign-In Failed",
        e.toString(),
      );

    } finally {

      isLoading.value = false;
    }
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? account = await _googleSignIn.authenticate();
  //
  //     if (account == null) {
  //       print("User canceled login");
  //       return;
  //     }
  //
  //     final GoogleSignInAuthentication auth = await account.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       idToken: auth.idToken,
  //     );
  //
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('email', account.email);
  //     await prefs.setString('username', account.displayName ?? 'User');
  //
  //     Get.offAll(() => const MainNavigationShell());
  //   } catch (e) {
  //     print("Google Login Error: $e");
  //   }
  // }

  Future<void> signup() async {
    if (Signformkey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: SignemailController.text.trim(),
        password: SignpasswordController.text.trim(),
      );

      await FirebaseAuth.instance.currentUser?.updateDisplayName(
        signupNameController.text.trim(),
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', SignemailController.text.trim());
      await prefs.setString('username', signupNameController.text.trim());

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

  Future<void> logout() async {
    try {
      isLoading.value = true;

      // ✅ Sign out from Firebase
      await _auth.signOut();

      // ✅ Sign out from Google (v7 API)
      try {
        await _googleSignIn.signOut();
      } catch (_) {
        // Google sign out may fail if user logged in with email/password
      }

      // ✅ Clear SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // ✅ Navigate back to Login Screen
      Get.offAll(() => const LoginScreen());

      Get.snackbar("Success", "Logged out successfully");
    } catch (e) {
      Get.snackbar("Logout Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
