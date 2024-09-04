import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  bool _isDarkMode = false;
  Locale _locale = Locale('en', 'id');

  bool get isDarkMode => _isDarkMode;
  Locale get locale => _locale;

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void changeLanguage(String languageCode) {
    _locale = Locale(languageCode, '');
    notifyListeners();
  }
}
