import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class SignupInputs extends StatelessWidget {
  SignupInputs({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.Signformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// NAME
          const Text("FULL NAME"),
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Alexander McQueen",
            ),
          ),

          const SizedBox(height: 20),

          /// EMAIL
          const Text("EMAIL"),
          TextFormField(
            controller: controller.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Email required";
              }
              if (GetUtils.isEmail(value)) {
                return "Invalid email";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "alexander@aura.fashion",
            ),
          ),

          const SizedBox(height: 20),

          /// PASSWORD
          const Text("PASSWORD"),
          TextFormField(
            controller: controller.passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password required";
              }
              if (value.length < 6) {
                return "Minimum 6 characters";
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "••••••••",
            ),
          ),
        ],
      ),
    );
  }
}