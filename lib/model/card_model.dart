

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CardModel extends ChangeNotifier{
 final  List _spisok=[
['Bronhit','eto bolezn dihatelnih putey','assets/images/bronhit.jpg',],
['Glaznoy','eto bolezn dihateasCSADClnih putey','assets/images/glaznoy.jpg'],
['Rakkkk','eto bolezn dihatQEW134134elnih putey','assets/images/rakkkk.jpg',],
['Skoliroliz','eto bolezn d1324124312424ihatelnih puteyакимоукпиопомкуамцоат ','assets/images/skoliroliz.jpg',]
 ];
 final List _cardItem=[];
get spisok=>_spisok;

get cardItem => _cardItem;

 addItemtoCard(int index){
  _cardItem.add(_spisok[index]);
   _selectedIndexes.add(index);
  saveData();
notifyListeners();
}
void removeItemCard(int index){
  _cardItem.removeAt(index);
   _selectedIndexes.remove(index);
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
    _cardItem.addAll(jsonDecode(value));
    notifyListeners();
  }
}
 final List<int> _selectedIndexes = [];
 get selectedIndexes => _selectedIndexes; 

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
