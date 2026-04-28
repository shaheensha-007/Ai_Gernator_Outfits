import 'package:ai_gernator_outfits/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';

class SignupTitle extends StatelessWidget {
  const SignupTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TText(
          text: 'Create\nAccount',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            height: 1.1,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 12),
        TText(
          text: 'Step into the future of fashion generation.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }
}