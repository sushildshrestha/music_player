import 'package:flutter/material.dart';
import 'package:music_player/theme/dark_theme.dart';
import 'package:music_player/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  //initially turn to light mode
  ThemeData _themeData = ThemeData();

  //get theme
  ThemeData get themeData => _themeData;

  //is dark mode
  bool get isDarkMode => _themeData == darkMode;

  //set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
  }

  //update user interface
  notifyListeners();

  //toggle theme
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
