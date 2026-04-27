import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class GenerateScreen extends StatelessWidget {
  const GenerateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.primary),
        title: const Text('A U R A', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, letterSpacing: 4)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('AI GENERATOR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary, letterSpacing: 1)),
            const SizedBox(height: 8),
            const Text('Elevate Your Style.', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('Upload your photo and let our AI curate the perfect ensemble based on your vision.', style: TextStyle(color: AppColors.textLight, height: 1.5)),
            const SizedBox(height: 32),

            // Upload Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 20, spreadRadius: 5)],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
                    child: const Icon(Icons.camera_alt_outlined, color: AppColors.primary, size: 32),
                  ),
                  const SizedBox(height: 16),
                  const Text('Upload Your Base\nPhoto', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Drag and drop or tap to select', style: TextStyle(color: AppColors.textLight, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Prompt Input
            const Text('THE VISION', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Describe the aesthetic, colors, or specific items...',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Style Presets
            const Text('STYLE PRESET', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ['CASUAL', 'FORMAL', 'VINTAGE', 'FUTURISTIC'].map((preset) {
                bool isSelected = preset == 'CASUAL';
                return ChoiceChip(
                  label: Text(preset, style: TextStyle(fontSize: 12, color: isSelected ? Colors.white : AppColors.textDark)),
                  selected: isSelected,
                  selectedColor: AppColors.primary,
                  backgroundColor: Colors.white,
                  onSelected: (bool selected) {},
                );
              }).toList(),
            ),
            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Generate Outfit'),
            )
          ],
        ),
      ),
    );
  }
}