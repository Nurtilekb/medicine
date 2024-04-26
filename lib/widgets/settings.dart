import 'package:dropdown_button2/dropdown_button2.dart';
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
                border: Border.all(width: 1, color: Colors.black45),
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
                border: Border.all(width: 1, color: Colors.black45),
                color: Provider.of<ThemeModel>(context).setingsColor,
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




List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> list) {
  final List<DropdownMenuItem<String>> menuItems = [];
  for (final String item in list) {
    menuItems.addAll(
      [
        DropdownMenuItem<String>(
          value: item,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
        //If it's last item, we will not add Divider after it.
        if (item != list.last)
          const DropdownMenuItem<String>(
            enabled: false,
            child: Divider(),
          ),
      ],
    );
  }
  return menuItems;
}

List<double> _getCustomItemsHeights() {
  final List<double> itemsHeights = [];
  for (int i = 0; i < (list.length * 2) - 1; i++) {
    if (i.isEven) {
      itemsHeights.add(40);
    }
    //Dividers indexes will be the odd indexes
    if (i.isOdd) {
      itemsHeights.add(4);
    }
  }
  return itemsHeights;
}







class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

List<String> list = <String>["Русский", 'English', 'Кыргызча'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String selectedValue = 'English';

  void loadlang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
  selectedValue = prefs.getString('language') ?? 'Русский';
});
  }

  @override
  void initState() {
    super.initState();
    loadlang();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          items: _addDividersAfterItems(list),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
              switch (
selectedValue         ) {
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

            });
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 6),
            height: 40,
            width: 150,
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            customHeights: _getCustomItemsHeights(),
          ),
          iconStyleData: const IconStyleData(
            openMenuIcon: Icon(Icons.arrow_drop_up),
          ),
        ),
      );
  }

  Future<void> russcha() async {
    sohr();
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
    await prefs.setString('language', selectedValue);
  }
}
