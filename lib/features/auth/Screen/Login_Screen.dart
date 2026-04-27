import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/Forgotpassword.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/Sign_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../controllers/main_contollers/Lanuage_Controller.dart';
import '../../../core/theme/app_theme.dart';
import '../../navigation/screen/Navigation_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: AppColors.primary),
        //   onPressed: () {},
        // ),
        title: const Text(
          'A U R A',
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                _showLanguageDialog(context);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary.withOpacity(0.2),
                child: const Icon(Icons.translate, color: AppColors.primary),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
             TText(text:
              'Welcome back.',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
             TText(text:
              'Enter your credentials to access your creative studio.',
              style: TextStyle(fontSize: 16, color: AppColors.textDark.withOpacity(0.8), height: 1.5),
            ),
            const SizedBox(height: 48),

            // Form Fields
             TText(text: 'EMAIL ADDRESS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
            TextFormField(
              decoration: const InputDecoration(hintText: 'name@example.com'),
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TText(text: 'PASSWORD', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const TText(text: 'FORGOT?', style: TextStyle(fontSize: 10, color: AppColors.primary, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: '••••••••'),
            ),
            const SizedBox(height: 48),

            // Sign In Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainNavigationShell()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shadowColor: AppColors.primary.withOpacity(0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child:  TText(text:
                    'SIGN IN',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: TText(text: 'OR CONTINUE WITH', style: TextStyle(fontSize: 10, color: AppColors.textDark.withOpacity(0.8), letterSpacing: 1)),
            ),
            const SizedBox(height: 24),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 🔵 Google Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          print('Google click');
                        },
                        icon: const Icon(Icons.g_mobiledata_sharp, color: AppColors.textDark),
                        label: const TText(text:
                          'Continue with Google',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: AppColors.textLight.withOpacity(0.2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 🍏 Apple Button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          print('Apple click');
                        },
                        icon: const Icon(Icons.apple, color: AppColors.textDark),
                        label: TText(text:
                          'Continue with Apple',
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(
                            color: AppColors.textLight.withOpacity(0.2),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 48),
            Center(
              child: GestureDetector(
                onTap: () {},
                child:
                // RichText(
                //   text: const TextSpan(
                //     text: 'New to Aura? ',
                //     style: TextStyle(color: AppColors.textLight, fontSize: 14),
                //     children: [
                //       TextSpan(text: 'Create an account', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                //     ],
                //   ),
                // ),

                TRichText(
                  segments: [
                    RichTextSegment(
                      text:
                      'New to Aura?',
                      style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w600)
                    ),
                    RichTextSegment(
                      text: 'Create an account',
                      style: TextStyle(color: AppColors.primary, fontSize: 14),
                      onTap: () async {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const SignUpScreen()),
                        );
                      },
                    ),
                  ],
                  baseStyle: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final languageController = Get.find<LanguageController>();

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      builder: (context) {
        // Get the controller instance
        final languageController = Get.find<LanguageController>();

        return ScaleTransition(
          scale: CurvedAnimation(
            parent: ModalRoute.of(context)!.animation!,
            curve: Curves.fastOutSlowIn,
          ),
          child: FadeTransition(
            opacity: ModalRoute.of(context)!.animation!,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              backgroundColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 4,
              ),
              title: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade600, Colors.purple.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.white, size: 24),
                    SizedBox(width: 12),
                    Text(
                      "Choose Language",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              content: Obx(() {
                // Access the observable inside Obx - this is CRITICAL
                final selectedLang = languageController.selectedLanguage.value;

                return SizedBox(
                  width: double.maxFinite,
                  height:
                  LanguageController.languages.length *
                      68.0, // Fixed height based on item count
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemCount: LanguageController.languages.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                    itemBuilder: (context, index) {
                      final entry = LanguageController.languages.entries
                          .elementAt(index);
                      final code = entry.key;
                      final name = entry.value;
                      final isSelected = selectedLang == code;

                      return Container(
                        height: 68,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? LinearGradient(
                            colors: [
                              Colors.blue.shade50,
                              Colors.purple.shade50,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                              : null,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          child: InkWell(
                            onTap: () async {
                              HapticFeedback.lightImpact();

                              if (selectedLang != code) {
                                await languageController.changeLanguage(code);
                                Navigator.pop(context);

                                // Optional: Show success message
                                Get.snackbar(
                                  'Language Changed',
                                  'App language changed to $name',
                                  backgroundColor: Colors.green,
                                  colorText: Colors.white,
                                  duration: Duration(seconds: 2),
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(8),
                            splashColor: Colors.blue.withOpacity(0.2),
                            highlightColor: Colors.purple.withOpacity(0.1),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.blue.shade100
                                          : Colors.grey.shade100,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: AnimatedSwitcher(
                                        duration: const Duration(
                                          milliseconds: 300,
                                        ),
                                        child: isSelected
                                            ? Icon(
                                          Icons.check,
                                          size: 18,
                                          color: Colors.blue.shade700,
                                          key: const ValueKey('selected'),
                                        )
                                            : Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.grey.shade400,
                                          ),
                                          key: const ValueKey(
                                            'unselected',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Text(
                                      name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        fontWeight: isSelected
                                            ? FontWeight.w600
                                            : FontWeight.w500,
                                        color: isSelected
                                            ? Colors.blue.shade800
                                            : Colors.grey.shade800,
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade100,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        "Selected",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                          color: Colors.blue.shade700,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade600,
                                Colors.purple.shade600,
                              ],
                              stops: const [0.3, 0.7],
                            ),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade600,
                                Colors.purple.shade600,
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.shade300.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
