import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medicine1/costants/text_style.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Dopkaprobolez extends StatelessWidget {
  const Dopkaprobolez({
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
  Widget build(BuildContext context) {
    var snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.snakbartitle1));
final colorAli=Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: colorAli.scafColor,
      scrolledUnderElevation:0,elevation: 0,
        title: Text(
          text1,
          style: ConstStyle.nazvonke,
        ),
        actions: [
          CircleAvatar(
            backgroundColor: colorAli.sohrColor,
            child: IconButton(
                onPressed: () {
                  Provider.of<Listbeck>(context, listen: false)
                      .addToFavorites(selectedIndex);

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(Icons.bookmark_border)),
          ),
          SizedBox(width: 10.w)
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                fit: BoxFit.contain,
                imagepath,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(width: MediaQuery.of(context).size.width,
          
          color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text1,style:TextStyle(fontFamily: 'Semibold.ttf',fontSize: 32,fontWeight: FontWeight.w600)),
                  Text(
                    text2,
                    style: const TextStyle(fontSize: 20,fontFamily: 'Semibold.ttf'
                     ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
