import 'package:ai_gernator_outfits/core/translate/translate_Widgets.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/Login_Screen.dart';
import 'package:ai_gernator_outfits/features/auth/Screen/login_screen.dart' hide LoginScreen;
import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textDark, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text(
          'A U R A',
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            // Used LayoutBuilder and ConstrainedBox to force footer to the bottom
            // while still allowing scrolling on small devices.
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                         TText(text:
                          'Reset\nPassword',
                          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, height: 1.1),
                        ),
                        const SizedBox(height: 16),
                         TText(text:
                          'Enter the email address associated with your account and we\'ll send you a recovery link.',
                          style: TextStyle(fontSize: 14, color: AppColors.textLight, height: 1.5),
                        ),
                        const SizedBox(height: 48),

                        // Input field
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email Address',
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Submit Button
                        ElevatedButton(
                          onPressed: () {
                            // Handle reset logic
                          },
                          child: const TText(text: 'Send Reset Link'),
                        ),
                        const SizedBox(height: 32),

                        // Back to login
                        Center(
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child:
                            // RichText(
                            //   text: const TextSpan(
                            //     text: 'Remembered your password? ',
                            //     style: TextStyle(color: AppColors.textLight, fontSize: 14),
                            //     children: [
                            //       TextSpan(
                            //           text: 'Log In',
                            //           style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            TRichText(
                              segments: [
                                RichTextSegment(
                                    text:
                                    'Remembered your password?',
                                    style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w600)
                                ),
                                RichTextSegment(
                                  text: 'Log In',
                                  style: TextStyle(color: AppColors.primary, fontSize: 14),
                                  onTap: () async {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                                    );
                                  },
                                ),
                              ],
                              baseStyle: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),

                        // Spacer pushes the footer to the bottom
                        const Spacer(),

                        // Footer details
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TText(text: '© 2026 AURA FASHION AI', style: TextStyle(fontSize: 10, color: AppColors.textLight.withOpacity(0.5), letterSpacing: 0.5)),
                              Row(
                                children: [
                                  TText(text: 'SUPPORT', style: TextStyle(fontSize: 10, color: AppColors.textLight.withOpacity(0.5), letterSpacing: 0.5)),
                                  const SizedBox(width: 16),
                                  TText(text: 'PRIVACY', style: TextStyle(fontSize: 10, color: AppColors.textLight.withOpacity(0.5), letterSpacing: 0.5)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}