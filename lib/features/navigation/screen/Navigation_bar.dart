import 'package:ai_gernator_outfits/features/Profilo/Profilo_Screen.dart';
import 'package:ai_gernator_outfits/features/studio/studio_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../explore/explore_Screen.dart';
import '../../generate/generate_screen.dart';
import '../../index/index_Screen.dart';

class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 1; // Defaulting to "Generate" as per UI

  // You would replace these with actual screen widgets
  final List<Widget> _screens = [
   const ExploreScreen(),
    const GenerateScreen(),
    const StudioScreen(),
    const InboxScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.explore_outlined, 'EXPLORE'),
                _buildNavItem(1, Icons.auto_awesome, 'GENERATE', isPrimary: true),
                _buildNavItem(2, Icons.layers_outlined, 'STUDIO'),
                _buildNavItem(3, Icons.notifications_none, 'INBOX'),
                _buildNavItem(4, Icons.person_outline, 'ME'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, {bool isPrimary = false}) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppColors.primary : AppColors.textLight;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: color,
            ),
          ),
          if (isSelected && isPrimary)
            Container(
              margin: const EdgeInsets.all(4),
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            )
        ],
      ),
    );
  }
}

// Temporary placeholder for the Generate View showing the inner card styling
// class GenerateScreenPlaceholder extends StatelessWidget {
//   const GenerateScreenPlaceholder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: const Icon(Icons.menu, color: AppColors.primary),
//         title: const Text('A U R A', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, letterSpacing: 4)),
//         centerTitle: true,
//         actions: const [Padding(padding: EdgeInsets.only(right: 16.0), child: Icon(Icons.image_outlined, color: AppColors.textDark))],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text('AI GENERATOR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary, letterSpacing: 1)),
//             const SizedBox(height: 8),
//             const Text('Elevate Your Style.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 12),
//             const Text('Upload your photo and let our AI curate the perfect ensemble based on your vision.', style: TextStyle(color: AppColors.textLight, height: 1.5)),
//             const SizedBox(height: 32),
//
//             // Upload Card (Glassmorphism / Soft UI)
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(32),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(24),
//                 boxShadow: [
//                   BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 20, spreadRadius: 5),
//                 ],
//               ),
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: AppColors.primary.withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.camera_alt_outlined, color: AppColors.primary, size: 32),
//                   ),
//                   const SizedBox(height: 16),
//                   const Text('Upload Your Base\nPhoto', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   const Text('Drag and drop or tap to select', style: TextStyle(color: AppColors.textLight)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton.icon(
//               onPressed: () {},
//               icon: const Icon(Icons.auto_awesome),
//               label: const Text('Generate Outfit'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }