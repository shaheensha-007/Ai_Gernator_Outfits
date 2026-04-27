import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // State for the style chips
  final List<String> _interests = [
    'Minimalist', 'Avant-Garde', 'Streetwear',
    'Cyberpunk', 'Vintage', 'Sustainable'
  ];
  final Set<String> _selectedInterests = {'Avant-Garde'}; // Default selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primary),
          onPressed: () {},
        ),
        title: const Text(
          'A U R A',
          style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, letterSpacing: 4),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: AppColors.surface,
              radius: 16,
              child: const Icon(Icons.person, color: AppColors.textDark, size: 20),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Immersive Header Image with Gradient
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/600x400'), // Replace with actual asset
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Redefine your\npersonal aesthetic.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
            ),

            // Form Content
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create\nAccount',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, height: 1.1),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Step into the future of fashion generation.',
                    style: TextStyle(fontSize: 14, color: AppColors.textLight),
                  ),
                  const SizedBox(height: 32),

                  // Inputs
                  const Text('FULL NAME', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Alexander McQueen'),
                  ),
                  const SizedBox(height: 24),

                  const Text('EMAIL ADDRESS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'alexander@aura.fashion'),
                  ),
                  const SizedBox(height: 32),

                  // Style Interests Chips
                  const Text('SELECT STYLE INTERESTS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 12.0,
                    children: _interests.map((interest) {
                      final isSelected = _selectedInterests.contains(interest);
                      return ChoiceChip(
                        label: Text(interest),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            selected ? _selectedInterests.add(interest) : _selectedInterests.remove(interest);
                          });
                        },
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : AppColors.textDark,
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                        backgroundColor: AppColors.surface,
                        selectedColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: isSelected ? AppColors.primary : AppColors.textLight.withOpacity(0.2),
                          ),
                        ),
                        showCheckmark: false,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),

                  // Create Button
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Create Free Account'),
                  ),
                  const SizedBox(height: 24),

                  // Login redirect
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: AppColors.textLight, fontSize: 14),
                          children: [
                            TextSpan(text: 'Sign In', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Socials
                  Center(child: Text('OR CONTINUE WITH', style: TextStyle(fontSize: 10, color: AppColors.textLight.withOpacity(0.5), letterSpacing: 1))),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.g_mobiledata, color: AppColors.textDark), // Google placeholder
                          label: const Text('GOOGLE', style: TextStyle(color: AppColors.textDark, fontSize: 12)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.apple, color: AppColors.textDark),
                          label: const Text('APPLE', style: TextStyle(color: AppColors.textDark, fontSize: 12)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Terms
                  Center(
                    child: Text(
                      'By signing up, you agree to Aura\'s Terms of Service\nand Privacy Policy.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.textLight.withOpacity(0.7), fontSize: 10, height: 1.5),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}