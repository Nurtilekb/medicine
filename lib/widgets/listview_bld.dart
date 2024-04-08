import 'package:flutter/material.dart';
import 'package:medicine1/model/card_model.dart';
import 'package:medicine1/widgets/containers.dart';
import 'package:provider/provider.dart';

import 'search_tme.dart';
import 'settings.dart';

class ListTabview extends StatefulWidget {
  const ListTabview({super.key});

  @override
  State<ListTabview> createState() => _ListTabviewState();
}

class _ListTabviewState extends State<ListTabview> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          SizedBox(width: 10,)
        ],
        backgroundColor: isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
        title: const SearchBar1(),
      ),
      body: Consumer<CardModel>(
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: value.spisok.length,
            itemBuilder: (context, index) {
              return ListContainer(
                text1: value.spisok[index][0],
                text2: value.spisok[index][1],
                imagepath: value.spisok[index][2],
                onPressed: () {
                  Provider.of<CardModel>(context, listen: false)
                      .addItemtoCard(index);
                  const snackBar = SnackBar(
                    content: Text('Вы добавили в Избранные'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                selectedIndex: index,
              );
            },
          );
        },
      ),
    );
  }
}
