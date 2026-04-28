import 'package:ai_gernator_outfits/controllers/Auth_controller/full_auth_contoller.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/Login_Appbar.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/Login_Form.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/Login_Headers.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/SignButton.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/Signup.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/SocialMedia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Scaffold(
      appBar: const LoginAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             LoginHeader(),
             SizedBox(height: 40),
             LoginForm(),
             SizedBox(height: 30),
             SignInButton(),
             SizedBox(height: 30),
             SocialLoginButtons(),
             SizedBox(height: 30),
             SignupRedirect(),
          ],
        ),
      ),
    );
  }
}