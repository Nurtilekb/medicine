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
      id: '1',
      glavtext: 'Бронхит',
      doptext: 'blablablablablablablablablablablablablablabla',
      imagePath: 'assets/images/bronhit.png'),
  ListModel(
      id: '2',
      glavtext: 'Бесплодие',
      doptext: """Мнение эксперта
      Бесплодие может ухудшить качество жизни женщины даже в том случае, если она не планирует рожать. Ряд патологий имеет тенденцию к прогрессированию, в результате чего возникают боли, нарушается гормональный фон, что сказывается на общем самочувствии, состоянии органов и систем, а также внешности. Частым последствием бесплодия у женщин являются психогенные расстройства в виде депрессии, повышенной тревожности. Около 60% браков распадаются из-за невозможности иметь ребенка.
      Не следует пытаться лечиться самостоятельно: принимать витамины, пить травы, антибиотики и гормональные препараты без назначения врача. Это может привести к эндокринному сбою, ускоренному развитию новообразований, усугублению состояния. Очень важно обратиться к врачу и выполнять все его рекомендации, чтобы стабилизировать работу репродуктивной системы.
      Калинина Наталья Анатольевна
      Врач-репродуктолог высшей категории, д.м.н., заведующая отделения ВРТ... """,
      imagePath: 'assets/images/besplodie.png'),
  ListModel(
      id: '3',
      glavtext: 'Печень',
      doptext: 'eto bolezn dihatQEW134134elnih putey',
      imagePath: 'assets/images/boyrok.png'),
  ListModel(
      id: '4',
      glavtext: 'Инфа́ркт',
      doptext: """Инфа́ркт миока́рда (серде́чный при́ступ) возникает из-за полной или частичной окклюзии артерии, питающей сердце. Нарушение поступления крови к сердцу может привести к серьёзному повреждению или гибели сердечной мышцы. Инфаркт миокарда — состояние, угрожающее жизни, поэтому важно вызвать скорую помощь как можно скорее, если вы подозреваете его у себя или другого человека[1].

      Как правило, симптомы инфаркта миокарда включают одышку, давление, жжение или боль в груди, которая может иррадиировать в шею, левую руку, спину или челюсть, также это может быть тошнота, боль в животе. Набор и выраженность симптомов могут различаться: кто-то испытывает сильную боль, у кого-то она выражена слабо или вовсе отсутствует. «Безболевой» (его также называют «тихим») инфаркт миокарда чаще переносят пожилые и люди с сахарным диабетом. Женщины чаще мужчин при сердечном приступе сообщают о нетипичных симптомах, например, о боли в верхней части спины или плечах, головокружении, необычной усталости. Симптомы могут появляться и исчезать в течение нескольких часов[2][3][4].

       Абсолютное большинство случаев инфаркта миокарда развивается у людей с ишемической болезнью сердца (ИБС). При ИБС стенки артерий, снабжающих кровью сердце, сужаются, в результате чего сердце получает меньше кислорода. Чаще всего сужение артерий происходит в результате отложения холестерина в стенках сосудов[1].""",
      imagePath: 'assets/images/hearth.png'),
  ListModel(
      id: '5',
      glavtext: 'Грыжа',
      doptext:
          """Грыжа («hernia» лат.) - это выпячивание, какого-либо органа или его части из брюшной полости под кожу через естественное отверстие (пупочное кольцо, паховый или бедренный канал), или через дефект в брюшной стенке, возникший в результате травмы, или ранее выполненной операции.
       Грыжи являются одним из самых распространённых хирургических заболеваний. Пациенты с грыжами составляют большинство в любом отделении плановой хирургии. В России ежегодно выполняется более 500 тысяч операций по этому поводу, в США около 700 тысяч, а в Европе более миллиона. Наиболее часто встречаются паховые грыжи.
        """,
      imagePath: 'assets/images/gryzha.png'),
];

