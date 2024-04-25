import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/app/providers/locale_providers.dart';
import 'package:medicine1/costants/text_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/them_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingList extends StatefulWidget {
  const SettingList({Key? key});

  @override
  State<SettingList> createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  double dlina = 16;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.black45),
                color: themeProvider.setingsColor,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 125.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.language,
                      style: ConstStyle.settingstyle,
                    ),
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
                border: Border.all(width: 1,color: Colors.black45),
             color:    Provider.of<ThemeModel>(context).setingsColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      AppLocalizations.of(context)!.theme,
                      style: ConstStyle.settingstyle,
                    )),
                    Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme();
                      },
                    )
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
}

List<String> list = <String>["Русский" ,'English','Кыргызча'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
        String dropdownValue=list.first;

        void loadlang()async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
  dropdownValue=prefs.getString('language') ?? 'Русский';

  }
@override
void initState() {
    super.initState();
   loadlang();
   setState(() {
     
   });
  }
  @override
  Widget build(BuildContext context) {



    return DropdownButton<String>(
      alignment: Alignment.center,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down_sharp,
      ),
      elevation: 16,
      style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: 16,
          fontWeight: FontWeight.w500),
      underline: Container(height: 2, color: Colors.black38),
      onChanged: (String? value) {
      

       
          dropdownValue = value!;
          
         switch (
dropdownValue         ) {
            case 'Русский':
              russcha();
              
              
              break;
            case 'English':
              englishche();
              break;
            case 'Кыргызча':
              kyrgyzcha();
              break;
          }
        
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.centerLeft,
          value:value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Future<void> russcha()  async {sohr();
    setState(() {
      Provider.of<LocaleProvider>(context, listen: false)
          .setLocale(const Locale('ru'));
    });
  }

  Future<void> kyrgyzcha() async {
    sohr();
    setState(() {
      Provider.of<LocaleProvider>(context, listen: false)
          .setLocale(const Locale('ky'));
    });
  }
  Future<void> englishche() async {
   sohr();
    setState(() {
      Provider.of<LocaleProvider>(context, listen: false)
          .setLocale(const Locale('en'));
    });
  }
Future<void> sohr() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', dropdownValue);
}
  
}
