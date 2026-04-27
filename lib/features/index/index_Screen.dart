import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Inbox', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          const Text('Stay updated with your latest generations and style discoveries.', style: TextStyle(color: AppColors.textLight)),
          const SizedBox(height: 32),
          const Text('RECENT ACTIVITIES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary, letterSpacing: 1)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            icon: Icons.auto_awesome,
            title: 'Your generation is ready',
            time: '2m ago',
            description: 'The "Cyber-Luxe Silk" collection results are processed and ready for your review.',
            isUnread: true,
          ),
          const SizedBox(height: 16),
          _buildNotificationItem(
            icon: Icons.explore,
            title: 'New collection available',
            time: '45m ago',
            description: 'Discover the "Obsidian Echo" drop. New materials now available.',
            isUnread: true,
          ),
          const SizedBox(height: 32),
          const Text('EARLIER', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textLight, letterSpacing: 1)),
          const SizedBox(height: 16),
          _buildNotificationItem(
            icon: Icons.favorite,
            title: 'Your collection is trending',
            time: 'Yesterday',
            description: '"Velvet Neon" has reached over 500 likes in the Global Discovery feed.',
            isUnread: false,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({required IconData icon, required String title, required String time, required String description, required bool isUnread}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.05), blurRadius: 10, spreadRadius: 2)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(time, style: const TextStyle(color: AppColors.textLight, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(description, style: const TextStyle(color: AppColors.textLight, fontSize: 12, height: 1.4)),
              ],
            ),
          ),
          if (isUnread) ...[
            const SizedBox(width: 8),
            Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
          ]
        ],
      ),
    );
  }
}