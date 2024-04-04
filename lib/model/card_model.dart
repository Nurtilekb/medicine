
import 'package:flutter/material.dart';

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
notifyListeners();
}
void removeItemCard(int index){
  _cardItem.removeAt(index);
  notifyListeners();
}

}