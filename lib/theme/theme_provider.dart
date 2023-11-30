import 'package:flutter/material.dart';
import 'themes_data.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  bool _isDark = false;
  bool get isDark => _isDark;

  void toggleTheme(bool newValue) {
    _isDark = newValue;
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
