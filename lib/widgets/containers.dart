import 'package:flutter/material.dart';



import '../costants/text_style.dart';

class ListContainer extends StatefulWidget {
  ListContainer({
    Key? key,
    required this.text1,
    required this.text2,
    required this.imagepath,
     required this.onPressed,
  }) : super(key: key);

  @override
  State<ListContainer> createState() => _ListContainerState();
  final String text1;
  final String text2;
  final String imagepath;
void Function()? onPressed;
}

class _ListContainerState extends State<ListContainer> {
  

  
  @override
  Widget build(BuildContext context) {
    
    return InkWell(
     onTap: () => widget.onPressed?.call(),


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
                  Image.asset(widget.imagepath),
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
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
