import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/signup_form.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/signup_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SignupHeader(),
            SignupFormSection(),
          ],
        ),
      ),
    );
  }
}