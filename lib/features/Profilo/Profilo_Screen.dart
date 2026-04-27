import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.settings_outlined, color: AppColors.textDark), onPressed: () {}),
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // Profile Header
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey, // Replace with NetworkImage
            ),
            const SizedBox(height: 16),
            const Text('Mohammed Shaheen pk', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: const Text('PRO CREATOR', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Digital fashion architect exploring the boundaries of AI-driven haute couture. Based in Paris.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textLight, fontSize: 12, height: 1.5),
              ),
            ),
            const SizedBox(height: 24),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStat('1.2k', 'GENERATIONS'),
                _buildStat('8.4k', 'LIKES RECEIVED'),
                _buildStat('45', 'COLLECTIONS'),
              ],
            ),
            const SizedBox(height: 24),

            // Tabs
            const TabBar(
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textLight,
              indicatorColor: AppColors.primary,
              tabs: [
                Tab(text: 'MY OUTFITS'),
                Tab(text: 'LIKED'),
                Tab(text: 'DRAFTS'),
              ],
            ),

            // Tab Content (Image Grid)
            Expanded(
              child: TabBarView(
                children: [
                  _buildPhotoGrid(),
                  _buildPhotoGrid(),
                  _buildPhotoGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textLight, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildPhotoGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7, // Taller items for fashion
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
        );
      },
    );
  }
}