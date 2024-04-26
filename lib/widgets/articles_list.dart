import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:medicine1/costants/text_style.dart';

import '../model/them_model.dart';
import '../ontapWidgets/articles_descript.dart';

class ArcticList extends StatelessWidget {
  const ArcticList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('This is a new articles for today',style: ConstStyle.nazvonke,),
          backgroundColor: Provider.of<ThemeModel>(context).toolColor,
          toolbarHeight: 30.h,
        ),
        body: GridView.builder(
          itemCount: 5,
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.2, //сколько виджетов может быть в 1 экране

              mainAxisSpacing: 15, //разделитель по вертикали
              crossAxisCount: 1), //по горизонтали число виджетов
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ArticleScreen( id: index, imagePath:'https://shrigramorganics.com/wp-content/uploads/2020/06/41g1S3Cp2L._SX425_.jpg', nadpis: 'Всем привет! Коллеги, подскажите пожалуйста какой есть способ для автоматического генерирования моделей для dart и php на основе одного конфига чтобы поддерживать соответствие клиента и сервера? Идея состоит в том чтобы один раз описать интерфейс для сущности в конфиге и по этому конфигурации генерировать модель на PHP и Dart и в эти модели маппить соответственно Request и Response на php и Dart. Swagger CodeGen evttn нечто похожее, но модель для PHP выглядит на мой взгляд отвратительно: какой-то уродливый класс с сеттерами и сеттерами вместо простой DTOшки',
                ),
                        ));
                  },
                  child:  GridWidget(
                    url:
                        'https://shrigramorganics.com/wp-content/uploads/2020/06/41g1S3Cp2L._SX425_.jpg',
                    text:
                        'Всем привет! Коллеги, подскажите пожалуйста какой есть способ для автоматического генерирования моделей для dart и php на основе одного конфига чтобы поддерживать соответствие клиента и сервера? Идея состоит в том чтобы один раз описать интерфейс для сущности в конфиге и по этому конфигурации генерировать модель на PHP и Dart и в эти модели маппить соответственно Request и Response на php и Dart. Swagger CodeGen evttn нечто похожее, но модель для PHP выглядит на мой взгляд отвратительно: какой-то уродливый класс с сеттерами и сеттерами вместо простой DTOшки',
                  ),
                ),
              ],
            );
          },
        ));
  }
}

class GridWidget extends StatelessWidget with ChangeNotifier {
   GridWidget({
    Key? key,
    required this.url,
    required this.text,
  }) : super(key: key);
  final String url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
         color:Color.fromARGB(223, 25, 194, 174), borderRadius: BorderRadius.circular(9)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [SizedBox(height: 3,),
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              fit: BoxFit.cover,
              url,
              height: 190.h,
              width: 350.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: ConstStyle.settingstyle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
