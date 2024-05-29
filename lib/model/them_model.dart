import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;
  Color get cardColor => _isDarkMode ? Color(0xFF1C1C1E) : Color(0xFFF9F9F9);
  Color get scafColor => _isDarkMode ? Color(0xFF090A0B) : Color(0xFFFFFFFF);
  Color get navbColor => _isDarkMode ? Colors.black : Color(0xFFFFFFFF);
  Color get searchColor => _isDarkMode ? const Color(0xFF1C1C1E) : const Color(0xFFEFEFEF);
  Color get toolColor =>_isDarkMode ? Colors.blueGrey : const Color.fromARGB(255, 90, 169, 175);
  Color get setingsColor => _isDarkMode ? const Color.fromARGB(255, 99, 114, 121) : const Color.fromARGB(210, 102, 202, 174);
  Color get vperediconCol => _isDarkMode ? Colors.white : Colors.black;
  bool get isDarkMode => _isDarkMode;

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }
}
