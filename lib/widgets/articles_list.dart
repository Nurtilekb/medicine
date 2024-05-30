import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/ontapWidgets/articles_descript.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:medicine1/costants/text_style.dart';

import '../model/them_model.dart';

class ArcticList extends StatelessWidget {
  const ArcticList({super.key});

  @override
  Widget build(BuildContext context) {
    final themprov = Provider.of<ThemeModel>(context);
    return Scaffold(
        backgroundColor: themprov.scafColor,
        appBar: AppBar(
          backgroundColor: themprov.scafColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 78.h,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.articles, style: ConstStyle.vverh),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Consumer<Listbeck>(
            builder: (context, listbeck, child) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ArticleScreen(
                                  id: 1,
                                  imagePath: 'assets/images/perhot.jpeg',
                                  nadpis:
                                      'This is perhotbek and he need a shampoo',
                                ),
                              ));
                        },
                        child: Card(
                          shadowColor: const Color(0xFF000000),
                          color: themprov.cardColor,
                          elevation:0.3,
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: 358.w,
                                  height: 104.h,
                                  padding:  const EdgeInsets.symmetric(horizontal: 12,
                                  vertical: 7),
                                  child: Row(
                                    children: [
                                      ClipRRect(borderRadius:BorderRadius.circular(12),
                                        child: Image.asset('assets/images/perhot.jpeg',
                                            height:80.h,
                                            width: 80.w,
                                            fit: BoxFit.cover),
                                      ),
                                      const SizedBox(width: 10),
                                       Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [ const Text(
                                              'Как лечить перхоть? ',
                                              style: ConstStyle.nazvbolez,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            const Text(
                                              '5 способов устранить перхоть',
                                              style: ConstStyle.nazvbolez,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                            SizedBox(height: 6.h),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Maria Zhang',
                                                  style: ConstStyle.descripbolez,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                                Container(height: 16.h,
                                                width: 16.w,
                                                  margin: EdgeInsets.only(left:25.w,right: 12.w), child: Image.asset('assets/images/time.png')),
                                                  const Text('5 min')
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 25.w,)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ));
  }
}
