
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:provider/provider.dart';

import '../costants/text_style.dart';
import '../model/card_model.dart';
import '../ontapWidgets/descrip_bolezn.dart';
import 'search_tme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavList extends StatefulWidget {
  const FavList({
    super.key,
  });

  @override
  State<FavList> createState() => _FavListState();
  
}
class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
       final themprov=Provider.of<ThemeModel>(context);


    return Scaffold(backgroundColor: themprov.scafColor,
      appBar: AppBar(backgroundColor: themprov.scafColor,
      elevation: 0,
      scrolledUnderElevation: 0,
        toolbarHeight: 78.h,
        title: Row(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Сохранненые',style: ConstStyle.vverh),
          ],
        ),  ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Consumer<Listbeck>(
          builder: (context, listbeck, child) {
            var snackBar = SnackBar(
                content: Text(AppLocalizations.of(context)!.snakbartitle2));
            return ListView.builder(
              itemCount: listbeck.cardItem.length,
              itemBuilder: (context, index) {
                final item = listbeck.cardItem[index];
                return Column(
                  children: [
                    InkWell(onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dopkaprobolez(
                                text1: item.glavtext,
                                imagepath: item.imagePath,
                                text2: item.doptext,
                                selectedIndex: index,
                              ),
                            ));
                    },
                      child: Card(shadowColor: Color(0xFF000000),
                        color: themprov.cardColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(side: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 358.w,
                              height: 87.h,
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Image.asset(item.imagePath,
                                        height: 50.h,
                                    width: 50.w,
                                        fit: BoxFit.cover),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                         mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.glavtext,
                                            style: ConstStyle.nazvbolez,
                                             overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  item.doptext,
                                                  style: ConstStyle.descripbolez,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              ),
                                             
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Provider.of<Listbeck>(context, listen: false)
                                      .removeFromFavorites(index);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon(Icons.delete_outlined))
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
      ),
    );
  }
  // void _runFilter2(String keyword) {

  //     Provider.of<Listbeck>(context, listen: false).filtertfavlist(keyword);


  // }
}
