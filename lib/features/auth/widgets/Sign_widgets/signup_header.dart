import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupHeader extends StatelessWidget {
  const SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/fast-fashion-concept-with-full-clothing-store.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: const TText(
          text: 'Redefine your\npersonal aesthetic.',
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
    );
  }
}