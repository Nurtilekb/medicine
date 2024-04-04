import 'package:flutter/material.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:provider/provider.dart';

import '../costants/text_style.dart';


class FavList extends StatefulWidget {
  const FavList({super.key,  });

  @override
  State<FavList> createState() => _KeepListState();
  
}
class _KeepListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardModel>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.cardItem.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card(
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
                              Image.asset(value.cardItem[index][2]),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Add some space between cards
              ],
            );
          },
        );
      },
    );
  }
}
