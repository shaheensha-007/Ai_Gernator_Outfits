import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:ai_gernator_outfits/features/navigation/screen/Navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class SignInButton extends StatelessWidget {
   SignInButton({super.key});


   final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: authController.isLoading.value
            ? null
            : () {
          authController.login(); // 🔥 CALL FIREBASE LOGIN
        },
        child: authController.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("SIGN IN"),
      ),
    ));
  }
}