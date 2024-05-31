import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

import 'package:medicine1/costants/text_style.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/model/them_model.dart';

class Dopkaprobolez extends StatelessWidget {
  const Dopkaprobolez({
    super.key,
    required this.selectedIndex,
    required this.text1,
    required this.text2,
    required this.imagepath,
  });

  final int selectedIndex;
  final String text1;
  final String text2;
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    var snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.snakbartitle1));
    final colorAli = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAli.scafColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: colorAli.sohrColor,
            child: IconButton(
                onPressed: () {
                  Provider.of<Listbeck>(context, listen: false)
                      .addToFavorites(selectedIndex);

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.bookmark_border)),
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300.h,
            child: Image.asset(
              fit: BoxFit.contain,
              imagepath,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text1, style: ConstStyle.descGlavText),
                  Text(
                    text2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                children: [
                  Text(
                    'Грыжа - это состояние позвоночника, при котором межпозвонковая жидкость выходит из позвонков',
                    style: ConstStyle.settingstyle,
                  ),
                  Text(
                    """

План
1.Что такое грыжа?
2.Причины возникновения
3.Методы лечения
4.Растяжка
5.Холодный душ
6.Питание
7.Итог""",
                    style: ConstStyle.settingstyle,
                  ),
                  SizedBox(
                    height: 30.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    'Что такое грыжа?',
                    style: ConstStyle.nazvonke,
                  ),
                  Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(24)),
                    width: MediaQuery.of(context).size.width,
                    height: 300.h,
                    child: Image.asset(
                      fit: BoxFit.contain,
                      imagepath,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}





















class DescriptOoru extends StatefulWidget {
  const DescriptOoru({
    Key? key,
    required this.selectedIndex,
    required this.text1,
    required this.text2,
    required this.imagepath,
  }) : super(key: key);
  final int selectedIndex;
  final String text1;
  final String text2;
  final String imagepath;
  @override
  State<DescriptOoru> createState() => _DescriptOoruState();
}

class _DescriptOoruState extends State<DescriptOoru> {
  
  @override
  Widget build(BuildContext context) {
     final colorAli = Provider.of<ThemeModel>(context);
       var snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.snakbartitle1));
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: colorAli.scafColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          CircleAvatar(
            backgroundColor: colorAli.sohrColor,
            child: IconButton(
                onPressed: () {
                  Provider.of<Listbeck>(context, listen: false)
                      .addToFavorites(widget.selectedIndex);

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.bookmark_border)),
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: Padding(padding: EdgeInsets.all(10),
      child:  CustomScrollView(
          slivers: [
            new SliverStickyHeader(
              header: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1.h,
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 300.h,
                        child: Image.asset(
                          widget.imagepath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                          widget.text1,
                        style: ConstStyle.descGlavText,
                      ),
                      Wrap(children: [
                        Text(
                            widget.text2,
                          style: ConstStyle.settingstyle,
                        )
                      ]),
                    ],
                  ),
                  childCount: 1,
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                alignment: Alignment.centerLeft,
                child: const Text('Plan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: " Semibold.ttf",
                    )),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text('1.Что такое грыжа?')),
                        const Wrap(
                          children: [
                            Text('cwcwwcwccwcwwcwcwwwcwwcdcdcdcdcdcdcdcdcdcd',style: ConstStyle.settingstyle,)
                          ],
                        )
                      ],
                    ),
                  ),
                  childCount: 1,
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                height: 60.0,
                alignment: Alignment.centerLeft,
                child: const Text('Что такое перхоть?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: " Semibold.ttf",
                    )),
              ),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 212.h,
                          child: Image.asset(
                              widget.imagepath,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const Wrap(
                          children: [
                            const Text('Грыжа – это состояние, при котором внутренний орган или ткань выступают за пределы своего обычного местоположения через слабые участки в окружающих их тканях или мышцах. Она может возникнуть в различных частях тела, но чаще всего встречается в области брюшной стенки. Грыжи могут быть вызваны различными факторами, включая слабость мышц, травмы или повышенное внутреннее давление.',style: ConstStyle.settingstyle)
                          ],
                        ),
                        const SizedBox(height: 20,)
                      ],
                    ),
                  ),
                  childCount: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}