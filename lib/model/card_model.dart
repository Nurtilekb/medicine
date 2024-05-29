import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Listbeck extends ChangeNotifier {
  List<ListModel> get mymodel => _filteredData.isEmpty ? _mymodel : _filteredData;
  List<ListModel> _redData = [];
  List<ListModel> _filteredData = [];
  List<ListModel> get cardItem => List.unmodifiable(_redData.isEmpty ?_cardItem:_redData);
  final List<ListModel> _cardItem = [];
 



  void addToFavorites(int index) {
    if (_cardItem.indexWhere((item) => item.id == _mymodel[index].id) == -1) {
      _cardItem.add(_mymodel[index]);
      notifyListeners();
      saveData();
    } else {
      print('Элемент уже в избранном');
    }
  }



  void removeFromFavorites(int index) {
    if (index >= 0 && index < _cardItem.length) {
      _cardItem.removeAt(index);
      notifyListeners();
      saveData();
    } else {
      print('Ошибка удаления элемента: неверный индекс');
    }
  }


  Future<void> saveData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encodedData =
          jsonEncode(_cardItem.map((item) => item.toJson()).toList());
      await prefs.setString('favoriteItems', encodedData);
    } catch (error) {
      print('Ошибка сохранения данных избранного: $error');
    }
  }

  Future<void> loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final value = prefs.getString('favoriteItems');

      if (value != null) {
        final decodedData = jsonDecode(value) as List;
        _cardItem.clear();
        for (final map in decodedData) {
          _cardItem.add(ListModel.fromJson(map));
        }
      }
      notifyListeners();
    } catch (error) {
      print('Ошибка загрузки данных избранного: $error');
    }
  }


  filterData(String keyword) {
    if (keyword.isEmpty) {
      _filteredData = [..._mymodel];
    } else {
      _filteredData.clear();
      final input = keyword.toLowerCase().trim();
      for (int i = 0; i < _mymodel.length; i++) {
        bool isContained = false;
        for (int j = 0; j < _mymodel.length; j++) {
          final data = _mymodel[i].glavtext.toLowerCase();
          if (data.contains(input)) {
            isContained = true;
           break;
          }
        }
        if (isContained) {
          _filteredData.add(_mymodel[i]);
          
        }
      }
    }
    notifyListeners();
  }


  void filtertfavlist(String keyword) {
    if (keyword.isEmpty) {
      _redData = _cardItem;
    } else {
      _redData = _cardItem
          .where((item) => item.glavtext
              .toLowerCase()
              .contains(keyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
 
  
}





class ListModel {
  final String id;

  final String glavtext;
  final String doptext;

  final String imagePath;

  ListModel({
    required this.id,
    required this.glavtext,
    required this.doptext,
    required this.imagePath,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'],
      glavtext: json['glavtext'],
      doptext: json['doptext'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'glavtext': glavtext,
      'doptext': doptext,
      'imagePath': imagePath,
    };
  }
}

List<ListModel> _mymodel = [
  ListModel(
      id: 'item1',
      glavtext: 'Item 1 Title',
      doptext: 'blablablablablablablablablablablablablablabla',
      imagePath: 'assets/images/bronhit.png'),
  ListModel(
      id: 'item2',
      glavtext: 'Бесплодие',
      doptext: """Мнение эксперта
Бесплодие может ухудшить качество жизни женщины даже в том случае, если она не планирует рожать. Ряд патологий имеет тенденцию к прогрессированию, в результате чего возникают боли, нарушается гормональный фон, что сказывается на общем самочувствии, состоянии органов и систем, а также внешности. Частым последствием бесплодия у женщин являются психогенные расстройства в виде депрессии, повышенной тревожности. Около 60% браков распадаются из-за невозможности иметь ребенка.
Не следует пытаться лечиться самостоятельно: принимать витамины, пить травы, антибиотики и гормональные препараты без назначения врача. Это может привести к эндокринному сбою, ускоренному развитию новообразований, усугублению состояния. Очень важно обратиться к врачу и выполнять все его рекомендации, чтобы стабилизировать работу репродуктивной системы.
Калинина Наталья Анатольевна
Врач-репродуктолог высшей категории, д.м.н., заведующая отделения ВРТ... """,
      imagePath: 'assets/images/besplodie.png'),
  ListModel(
      id: 'item3',
      glavtext: 'Rakkkk',
      doptext: 'eto bolezn dihatQEW134134elnih putey',
      imagePath: 'assets/images/boyrok.png'),
  ListModel(
      id: 'item4',
      glavtext: 'Skoliroliz',
      doptext: 'eto bolezn d1324124312424ihatelnih puteyакимоукпиопомкуамцоат ',
      imagePath: 'assets/images/hearth.png'),
  ListModel(
      id: 'itemqwdcm',
      glavtext: 'Item 1 Tceqwcdeqitle',
      doptext:
          'blablaqcdqwqrewvcjerfckmqlewkxlablablablablablablablablablablablabla',
      imagePath: 'assets/images/gryzha.png'),
];

