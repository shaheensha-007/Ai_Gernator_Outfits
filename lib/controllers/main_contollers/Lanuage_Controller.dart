import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  final RxString selectedLanguage = 'en'.obs;

  static const Map<String, String> languages = {
    'en': 'English',
    'hi': 'Hindi',
    'bn': 'Bengali',
    'ml': 'Malayalam',
    'ta': 'Tamil',
    'te': 'Telugu',
  };

  @override
  void onInit() {
    super.onInit();
    _loadSavedLanguage();
  }

  /// Load saved language from SharedPreferences
  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLang = prefs.getString('selected_language') ?? 'en';
      selectedLanguage.value = savedLang;
    } catch (e) {
      print("Error loading language: $e");
    }
  }

  /// Change language and save permanently
  Future<void> changeLanguage(String langCode) async {
    try {
      selectedLanguage.value = langCode;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_language', langCode);
    } catch (e) {
      print("Error saving language: $e");
    }
  }

  String getLanguageName() {
    return languages[selectedLanguage.value] ?? 'English';
  }
}
