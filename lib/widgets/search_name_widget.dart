import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:provider/provider.dart';

class SearchBar1 extends StatefulWidget {
  

   const SearchBar1({
    super.key, required this.onTextChanged, 
  

  });
  @override
  State<SearchBar1> createState() => _SearchBar1State();
    final void Function(String) onTextChanged;

}


class _SearchBar1State extends State<SearchBar1> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themprov = Provider.of<ThemeModel>(context);
    return Container(
      decoration: BoxDecoration(
        color: themprov.searchColor,
       
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      height: 48.h,
      width: 358.w,
      child: Row(
        children: [const SizedBox(width: 10,),
         SizedBox(height:20.h,
         width: 20.w,
         child:  Image.asset('assets/images/poisk.png')),
          Expanded(
            child: TextFormField(
              controller: controller,

              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                     EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                hintText: AppLocalizations.of(context)!.hintText,
              ),
              onChanged:widget.onTextChanged ,
            ),
          ),
        ],
      ),
    );
  }
  
}
