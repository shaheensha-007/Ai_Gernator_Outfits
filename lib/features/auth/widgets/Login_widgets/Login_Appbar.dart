import 'package:ai_gernator_outfits/features/auth/widgets/Login_widgets/Language%20Dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LoginAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("A U R A"),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.translate),
          onPressed: () => showLanguageDialog(context),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}