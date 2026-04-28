import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SocialLoginButtons extends StatelessWidget {
   SocialLoginButtons({super.key});

   final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR CONTINUE WITH"),
        const SizedBox(height: 20),

        OutlinedButton.icon(
          onPressed: () {
            authController.signInWithGoogle();
          },
          icon: const Icon(Icons.g_mobiledata),
          label: const Text("Continue with Google"),
        ),

        const SizedBox(height: 10),

        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.apple),
          label: const Text("Continue with Apple"),
        ),
      ],
    );
  }
}