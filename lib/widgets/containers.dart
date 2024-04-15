import 'package:flutter/material.dart';

import 'package:medicine1/ontapWidgets/descrip_bolezn.dart';

import '../costants/text_style.dart';

// ignore: must_be_immutable
class ListContainer extends StatefulWidget {
  ListContainer({
    super.key,
    required this.text1,
    required this.text2,
    required this.imagepath,
    required this.onPressed,
    required this.selectedIndex,
  });

  @override
  State<ListContainer> createState() => _ListContainerState();
  final String text1;
  final String text2;
  final String imagepath;
  void Function()? onPressed;
  final int selectedIndex;
}

class _ListContainerState extends State<ListContainer> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dopkaprobolez(
                text1: widget.text1,
                text2: widget.text2,
                imagepath: widget.imagepath,
                selectedIndex: widget.selectedIndex,
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
        child: Row(children: [
          Expanded(
            child: Container(
              width: 200,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(widget.imagepath,
                      height: 90, width: 100, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.text1,
                          style: ConstStyle.nazvbolez,
                        ),
                        Text(
                          widget.text2,
                          style: ConstStyle.descripbolez,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: widget.onPressed, icon: const Icon(Icons.star))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
