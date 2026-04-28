import 'package:ai_gernator_outfits/features/auth/Screen/Login_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        },
        child: const Text("Already have an account? Login"),
      ),
    );
  }
}