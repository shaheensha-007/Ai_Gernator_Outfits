import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';
import 'package:flutter/cupertino.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        TText(
          text: 'Welcome back.',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TText(
          text: 'Enter your credentials to access your creative studio.',
        ),
      ],
    );
  }
}