import 'package:flutter/material.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/widgets/containers.dart';
import 'package:provider/provider.dart';


class ListTabview extends StatefulWidget {
  const ListTabview({Key? key}) : super(key: key);

  @override
  State<ListTabview> createState() => _ListTabviewState();
}

class _ListTabviewState extends State<ListTabview> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CardModel>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.spisok.length, 
          itemBuilder: (context, index) {
            return ListContainer(
              text1: value.spisok[index][0],
              text2: value.spisok[index][1],
              imagepath: value.spisok[index][2],
              onPressed: () {
                Provider.of<CardModel>(context, listen: false).addItemtoCard(index);
              },
            );
          },
        );
      },
    );
  }
}
