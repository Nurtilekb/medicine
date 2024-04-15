import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/widgets/containers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../model/them_model.dart';
import 'search_tme.dart';
import 'settings.dart';

class ListTabview extends StatefulWidget {
  const ListTabview({super.key});

  @override
  State<ListTabview> createState() => _ListTabviewState();
}

class _ListTabviewState extends State<ListTabview> {
  // final  List<List<String>> results = [];
  @override
  Widget build(BuildContext context) {
    var snackBar =
        SnackBar(content: Text(AppLocalizations.of(context)!.snakbartitle1));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.h,
        actions: [
          SizedBox(width: 10.w),
        ],
        backgroundColor: isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
        title: const SearchBar1(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Consumer<CardModel>(
          builder: (context, cardModel, child) {
            final List<List<String>> displayList = cardModel.spisok;
            return ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) {
                final card = displayList[index];
                return ListContainer(
                  text1: card[0],
                  text2: card[1],
                  imagepath: card[2],
                  onPressed: () {
                    Provider.of<CardModel>(context, listen: false)
                        .addItemtoCard(index);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text(AppLocalizations.of(context)!.snakbartitle1),
                    ));
                  },
                  selectedIndex: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
