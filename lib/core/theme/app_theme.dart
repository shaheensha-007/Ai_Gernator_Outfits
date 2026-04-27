import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Centralized color palette for the Aura App
class AppColors {
  static const Color primary = Color(0xFF4C3AE3); // Aura Purple
  static const Color background = Color(0xFFF7F7FF); // Light tinted background
  static const Color surface = Colors.white; // Cards and dialogs

  static const Color textDark = Color(0xFF101018); // Main headings & text
  static const Color textLight = Color(0xFF8A8A9E); // Subtitles & hints
  static const Color divider = Color(0xFFE5E5EA); // Borders & dividers
}

/// Centralized theme configuration
class AppTheme {
  // We use a static getter so we can easily access it in MaterialApp
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        background: AppColors.background,
        surface: AppColors.surface,
      ),

      // -- Typography --
      // Automatically applies Inter font to all text in the app
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: AppColors.textDark,
        displayColor: AppColors.textDark,
      ),

      // -- App Bar Theme --
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primary),
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),

      // -- Elevated Button Theme (Primary Buttons) --
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 8,
          shadowColor: AppColors.primary.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 56), // Full width by default
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      // -- Outlined Button Theme (Secondary/Social Buttons) --
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textDark,
          side: BorderSide(color: AppColors.textLight.withOpacity(0.2)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),

      // -- Text Field Input Theme --
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        hintStyle: const TextStyle(color: AppColors.textLight, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),

        // Default border (Underline for login screens)
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textLight.withOpacity(0.2)),
        ),
        // Active border
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        // Error border
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
      ),

      // -- Tab Bar Theme (For Profile Screen) --
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textLight,
        indicatorColor: AppColors.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),

      // -- Bottom Navigation Bar Theme --
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
      ),
    );
  }
}