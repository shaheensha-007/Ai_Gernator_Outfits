import 'package:ai_gernator_outfits/features/auth/Screen/Sign_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupRedirect extends StatelessWidget {
  const SignupRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const SignUpScreen()),
          );
        },
        child: const Text("New to Aura? Create an account"),
      ),
    );
  }
}