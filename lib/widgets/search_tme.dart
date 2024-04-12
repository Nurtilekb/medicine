import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SearchBar1 extends StatefulWidget {
  const SearchBar1({super.key});

  @override
  State<SearchBar1> createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border:Border.all(color: Colors.black,width: 1) ,
      borderRadius: const BorderRadius.all(Radius.circular(8))),
      height: 40.h,
      width: 350.w,
      child: TextFormField(
        onTapAlwaysCalled : false,
        controller: controller,
        cursorColor:Color.fromARGB(255, 18, 38, 55),
        decoration: InputDecoration(border: InputBorder.none,
          contentPadding: const EdgeInsets.only(bottom: 4.0, left: 8, right: 8,top:2),
         
          hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          hintText: AppLocalizations.of(context)!.hintText,
        ),
      ),
    );
  }
}
