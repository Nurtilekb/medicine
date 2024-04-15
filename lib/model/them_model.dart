import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardModel extends ChangeNotifier {
  final List<List<String>> _spisok = [
    ['Bronhit', 'eto bolezn dihatelnih putey', 'assets/images/bronhit.jpg'],
    [
      'Glaznoy',
      'eto bolezn dihateasCSADClnih putey',
      'assets/images/glaznoy.jpg'
    ],
    [
      'Rakkkk',
      'Рак кожи может случиться с кем угодно, в любом возрасте, на любой части тела. А поскольку рак кожи бывает разных форм и размеров, его бывает сложно идентифицировать. В то время как изображения рака кожи могут быть полезны для изучения того, как может выглядеть рак кожи, для знакомства с собственной кожей и понимания что искать может помочь вам обнаружить рак на ранней стадии, когда его легче всего dfsvwfejdhv jwhf dvj erhjfd vhrfvh hvhtvhtevrewfvcerfv fdvrejhbvuebrvhebrv efviwebriuv /n wevnwiernvnerwnvjcenrincviqr/ewrvewrvewrverve',
      'assets/images/rakkkk.jpg'
    ],
    [
      'Glaznoy',
      'eto bolezn dihateasCSADClnih putey',
      'assets/images/glaznoy.jpg'
    ],
  ];

  List<List<String>> _filteredData = [];

  final List<List<String>> _cardItem = [];

  get spisok => _filteredData;

  get cardItem => _cardItem;

  addItemtoCard(int index) {
    _cardItem.add(_spisok[index]);

    saveData();
    notifyListeners();
  }

  void removeItemCard(int index) {
    _cardItem.removeAt(index);

    notifyListeners();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cardItem', jsonEncode(_cardItem));
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString('cardItem');
    if (value != null) {
      _cardItem.clear();
      final decoded = jsonDecode(value) as List;
      
      for (int i  = 0; i < decoded.length; i++) {
        final data = decoded[i] as List;
        _cardItem.add([]);
        
        for (int j = 0; j < data.length; j++) {
          (_cardItem[i] as List).add(data[j]);
        }
      }
      notifyListeners();
    }
  }

  filterData(String keyword) {
    if (keyword.isEmpty) {
      _filteredData = [..._spisok];
    } else {
      _filteredData.clear();
      final input = keyword.toLowerCase().trim();
      for (int i = 0; i < _spisok.length; i++) {
        bool isContained = false;
        for (int j = 0; j < _spisok[i].length; j++) {
          final data = _spisok[i][j].toLowerCase();
          if (data.contains(input)) {
            isContained = true;
            break;
          }
        }
        if (isContained) {
          _filteredData.add(_spisok[i]);
        }
      }
    }
    notifyListeners();
  }
}

class ThemeModel extends ChangeNotifier {
  bool _isDarkMode = false;

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
