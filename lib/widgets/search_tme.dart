import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar1 extends StatefulWidget {
  const SearchBar1({super.key});

  @override
  State<SearchBar1> createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 350.w,
      child: TextFormField(
        
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 4.0, left: 8, right: 8),
          border: OutlineInputBorder( 
            borderRadius: BorderRadius.circular(8),
          ),
          hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          hintText: 'Search',
        ),
      ),
    );
  }
}
