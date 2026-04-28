import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/SignupTitle.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/create_account_button.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/interest_chips.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/login_redirect.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/signup_inputs.dart';
import 'package:ai_gernator_outfits/features/auth/widgets/Sign_widgets/social_signup.dart';
import 'package:flutter/cupertino.dart';

class SignupFormSection extends StatelessWidget {
  const SignupFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          SignupTitle(),
          SizedBox(height: 20),
          SignupInputs(),
          SizedBox(height: 20),
          InterestChips(),
          SizedBox(height: 30),
          CreateAccountButton(),
          SizedBox(height: 20),
          LoginRedirect(),
          SizedBox(height: 20),
          SocialSignup(),
        ],
      ),
    );
  }
}