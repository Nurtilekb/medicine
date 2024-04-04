import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../ontapWidgets/descript_for_setting.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListView(
        children: const [
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.abc_sharp),
            jazuu1: 'Шрифт',
            jazuu2: 'Размер,Стиль,Интервал',
          ),
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.image_outlined),
            jazuu1: 'Интерфейс',
            jazuu2: 'uhhtyyy',
          ),
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.search),
            jazuu1: 'Поиск',
            jazuu2: 'Настройки поиска',
          ),
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.sim_card),
            jazuu1: 'Данные пользователя',
            jazuu2: 'Импорт/Экспорт/Сброс',
          ),
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.video_chat),
            jazuu1: 'Аудио',
            jazuu2: 'blabla',
          ),
          SizedBox(height: 10),
          SettinWidget(
            ikon: Icon(Icons.scanner),
            jazuu1: 'Системные настройки',
            jazuu2: 'Настройки Android',
          ),
        ],
      ),
    );
  }
}

class SettinWidget extends StatelessWidget {
  const SettinWidget(
      {super.key,
      required this.ikon,
      required this.jazuu1,
      required this.jazuu2});
  final Icon ikon;
  final String jazuu1;
  final String jazuu2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) => DescripSettings(),));
      },
      child: Container(
        decoration:  const BoxDecoration(
         backgroundBlendMode:BlendMode.exclusion,
            color: Color.fromARGB(175, 255, 248, 225),
            borderRadius: BorderRadius.all(Radius.circular(5)) ),
        height: 55,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 16),
            ikon,
            const SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jazuu1,
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                Text(
                  jazuu2,
                  style: const TextStyle(color: Colors.black87),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
