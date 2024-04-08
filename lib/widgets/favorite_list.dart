import 'package:flutter/material.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/ontapWidgets/descrip_bolezn.dart';
import 'package:medicine1/widgets/settings.dart';
import 'package:provider/provider.dart';

import '../costants/text_style.dart';
import 'search_tme.dart';

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
              toolbarHeight: 65,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                
              ],
              backgroundColor:
                  isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
              title: const SearchBar1(),
            ),
      body: Consumer<CardModel>(
        builder: (context, value, child) {
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
                                const snackBar = SnackBar(
                                  content: Text('Вы удалили из Избранных'),
                                );
      
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(Icons.delete_outlined))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
