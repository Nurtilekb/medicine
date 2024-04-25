import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      height: 40.h,
      width: 350.w,
      child: Row(
        children: [SizedBox(width: 10,),
          Icon(Icons.search),
          Expanded(
            child: TextFormField(
              controller: controller,
              cursorColor: const Color.fromARGB(255, 18, 38, 55),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.only(bottom: 10.0, left: 8, right: 8, top: 1),
                hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
