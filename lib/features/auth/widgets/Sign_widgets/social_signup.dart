import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SocialSignup extends StatelessWidget {
   SocialSignup({super.key});

   final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
             controller.signInWithGoogle();
            },
            icon: const Icon(Icons.g_mobiledata),
            label: const Text("GOOGLE"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // Apple login
            },
            icon: const Icon(Icons.apple),
            label: const Text("APPLE"),
          ),
        ),
      ],
    );
  }
}