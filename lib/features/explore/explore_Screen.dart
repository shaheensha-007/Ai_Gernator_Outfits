import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Curated Styles', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list, color: AppColors.textDark), onPressed: () {}),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: AppColors.textLight.withOpacity(0.2), // Placeholder for image
              image: const DecorationImage(
                // Replace with NetworkImage or AssetImage
                image: NetworkImage('https://via.placeholder.com/400x600'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      // Floating Search Bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(color: AppColors.primary.withOpacity(0.1), blurRadius: 20, spreadRadius: 5),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search styles...',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: const Icon(Icons.search, color: AppColors.primary),
            suffixIcon: IconButton(
              icon: const Icon(Icons.mic, color: AppColors.primary),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}