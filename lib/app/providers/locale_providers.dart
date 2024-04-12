import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("ru");

  Locale get locale => _locale;

  Future<void> loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLocale;
    String? languageCode = prefs.getString('languageCode');
    if (languageCode != null) {
      _locale = Locale(languageCode);
    }
    
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
  _locale = locale;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('languageCode', locale.languageCode);
  
  
  await saveSelectedLanguage(locale.languageCode);

  notifyListeners();
}
  
  Future<void> saveSelectedLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }
}

