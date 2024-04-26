import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:medicine1/ontapWidgets/descrip_bolezn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../costants/text_style.dart';
import '../model/card_model.dart';
import 'search_tme.dart';

class ListTabview extends StatefulWidget {
  const ListTabview({super.key});

  @override
  State<ListTabview> createState() => _ListTabviewState();
}

class _ListTabviewState extends State<ListTabview> {

  @override
  Widget build(BuildContext context) {
   final themprov=Provider.of<ThemeModel>(context);
   final  pr=Provider.of<Listbeck>(context).mymodel;
    final snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.snakbartitle1),);
      
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        actions: [
          SizedBox(width: 10.w),
        ],
        backgroundColor: themprov.toolColor,
        title:   SearchBar1(onTextChanged: _runFilter,),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: ListView.builder(
            itemCount: pr.length,
            itemBuilder: (BuildContext context, int index) {
              final item = pr[index];
              return Column(children: [
                InkWell( onTap: (){   
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dopkaprobolez(
                                text1: item.glavtext,
                                imagepath: item.imagePath,
                                text2: item.doptext,
                                selectedIndex: index,
                              ),
                            ));},
                  child: Card(
                      color: Provider.of<ThemeModel>(context).cardColor,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      key: Key(item
                          .id), 
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: 200,
                              height: 100,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(item.imagePath,
                                      height: 90, width: 100, fit: BoxFit.cover),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.glavtext,
                                          style: ConstStyle.nazvbolez,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          item.doptext,
                                          style: ConstStyle.descripbolez,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
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
                                      .addToFavorites(index);

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                icon: const Icon( Icons.bookmark_border)) ],
                      )),
                )
              ]);
            },
          )),
    );
    
  }void _runFilter(String keyword) {

      Provider.of<Listbeck>(context, listen: false).filterData(keyword);


  }
}