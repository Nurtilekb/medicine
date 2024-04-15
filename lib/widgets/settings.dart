
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/app/providers/locale_providers.dart';
import 'package:medicine1/costants/text_style.dart';
import 'package:provider/provider.dart';

import '../model/them_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingList extends StatefulWidget {
 const  SettingList({Key? key});

  @override
  State<SettingList> createState() => _SettingListState();

}

class _SettingListState extends State<SettingList> {
  
  double dlina = 16;
   bool isSwitched = false;  
   bool isDarkMode=false;
  


  @override
  Widget build(BuildContext context) {
       final themeProvider = Provider.of<ThemeModel>(context);
    
    return Scaffold(
      
        body: Padding(
          padding:  const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:   const Color.fromARGB(185, 85, 83, 79),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 125.h,
                child:   Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(AppLocalizations.of(context)!.language,style: ConstStyle.settingstyle,),
                      const Divider(color: Colors.black26),
                      const Row(
                        children: [
                                         DropdownButtonExample(),
                         
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(185, 85, 83, 79),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: Text(AppLocalizations.of(context)!.theme,style: ConstStyle.settingstyle,)),
                     Switch( value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme();
              },)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
     
    );
  }
}








class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
  
}bool isDarkMode = true;
 List<String> list = <String>['Русский', 'English', 'Turkçe', 'Кыргызча'];
class _DropdownButtonExampleState extends State<DropdownButtonExample> {
 void englishche(){setState(() {
    Provider.of<LocaleProvider>(context,listen: false).setLocale(const Locale('en'));
     
 });
 
  
  
 }

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
   
    return DropdownButton<String>(
      
      alignment: Alignment.center,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_sharp,),
      elevation: 16,
      style:   TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color,
      fontSize: 16,
      fontWeight: FontWeight.w500),
      underline: Container(
        height: 2,
       
        color: Colors.black38
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
         switch (dropdownValue) {
            case 'Русский':
             russcha();
              break;
            case 'English':
            englishche();
              break;
            case 'Turkçe':
          
              break;
            case 'Кыргызча':
            
              break;
          }
                
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.centerLeft,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  
  void russcha() {setState(() {
    Provider.of<LocaleProvider>(context,listen: false).setLocale(const Locale('ru'));
  });
 
 
  
}
}