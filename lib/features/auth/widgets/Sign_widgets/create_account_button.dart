import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class CreateAccountButton extends StatelessWidget {
  CreateAccountButton({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () {
          controller.signup(); // 🔥 FIREBASE CALL
        },
        child: controller.isLoading.value
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text("Create Free Account"),
      ),
    ));
  }
}