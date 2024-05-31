import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:medicine1/costants/text_style.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  final int id;
  final String imagePath;
  final String nadpis1;

  final String nadpis2;

  const ArticleScreen({
    super.key,
    required this.id,
    required this.imagePath,
    required this.nadpis1,
    required this.nadpis2,
  });

  @override
  Widget build(BuildContext context) {
    final colorAli = Provider.of<ThemeModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorAli.scafColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          CircleAvatar(
              backgroundColor: colorAli.sohrColor,
              child: const Icon(Icons.bookmark_border)),
          SizedBox(width: 10.w)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            new SliverStickyHeader(
              header: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1.h,
                child: const Text('wefvwevw'),
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
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        nadpis1,
                        style: ConstStyle.descGlavText,
                      ),
                      Wrap(children: [
                        Text(
                          nadpis2,
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
                            Text('cwcwwcwccwcwwcwcwwwcwwcdcdcdcdcdcdcdcdcdcd')
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
                child: const Text('Что такое перхоть',
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
                          height: 300.h,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Wrap(
                          children: [
                            const Text('cwcwwcwccwcwwcwcwwwcwwcdcdcdcdcdcdcdcdcdcd')
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
