import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/Forgotpassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class LoginForm extends StatelessWidget {
   LoginForm({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TText(text: "EMAIL ADDRESS"),
        TextFormField(
          controller: authController.emailController,
          decoration: const InputDecoration(hintText: 'name@example.com'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Email required";
            }
            if (GetUtils.isEmail(value)) {
              return "Invalid email";
            }
            return null;
          },
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TText(text: "PASSWORD"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                );
              },
              child: const Text("FORGOT?"),
            ),
          ],
        ),

        TextFormField(
          controller: authController.passwordController,
          obscureText: true,
          decoration: const InputDecoration(hintText: '••••••'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Password required";
            }
            if (value.length < 6) {
              return "Min 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }
}