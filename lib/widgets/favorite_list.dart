import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/ontapWidgets/descrip_bolezn.dart';
import 'package:medicine1/widgets/settings.dart';
import 'package:provider/provider.dart';

import '../costants/text_style.dart';
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
    return Scaffold( appBar: AppBar(
              toolbarHeight: 65.h,
              actions: [
               
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                SizedBox(width: 10.w), 
              ],
              backgroundColor:
                  isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
              title: const SearchBar1(),
             
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Consumer<CardModel>(
          builder: (context, value, child) {
           var snackBar = SnackBar(
                      content: Text(AppLocalizations.of(context)!.snakbartitle2)
                    );
            return ListView.builder(
              itemCount: value.cardItem.length,
              itemBuilder: (context, index) {
              
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Dopkaprobolez(
                                selectedIndex: 1,
                                text1: '',
                                imagepath: '',
                                text2: '',
                              ),
                            ));
                      },
                      child: Card(
                        color: const Color.fromARGB(66, 0, 187, 212),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 200,
                                height: 100,
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Image.asset(value.cardItem[index][2],
                                        height: 90, width: 100, fit: BoxFit.cover),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.cardItem[index][0],
                                            style: ConstStyle.nazvbolez,
                                          ),
                                          Text(
                                            value.cardItem[index][1],
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
                                  Provider.of<CardModel>(context, listen: false)
                                      .removeItemCard(index);
                                   
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
}
