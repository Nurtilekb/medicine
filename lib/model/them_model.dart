
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;
 Color get cardColor => _isDarkMode ? Colors.blueGrey[700]! : const Color.fromRGBO(77, 255, 213, 1); 
  Color get searchColor=>_isDarkMode ? const Color.fromARGB(255, 147, 167, 177) : const Color.fromARGB(211, 120, 227, 90);
  Color get toolColor=>_isDarkMode ? Colors.blueGrey : const Color.fromARGB(255, 90, 169, 175);
Color get setingsColor=>_isDarkMode ? const Color.fromARGB(255, 99, 114, 121) : const Color.fromARGB(210, 102, 202, 174);
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
