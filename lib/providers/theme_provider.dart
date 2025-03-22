import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
