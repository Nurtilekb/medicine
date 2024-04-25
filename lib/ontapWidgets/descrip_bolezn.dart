import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medicine1/costants/text_style.dart';



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

   

    return Scaffold(
      appBar: AppBar(title: Text(text1,style: ConstStyle.nazvonke,),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
                height: 250.h,
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(width: 2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                    fit: BoxFit.cover,
                  imagepath,
                  
                  
                
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(text2,style:const TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
