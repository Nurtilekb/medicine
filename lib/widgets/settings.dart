import 'package:flutter/cupertino.dart';
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
  bool isSwitched = false;
  int selectedIndex = 1;

  void loadlang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('index') ?? 1;
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
    final themeProvider = Provider.of<ThemeModel>(context);

    return Scaffold(
      backgroundColor: themeProvider.scafColor,
      appBar: AppBar(
        backgroundColor: themeProvider.scafColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 78.h,
        title:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( AppLocalizations.of(context)!.settings, style: ConstStyle.vverh),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListView(
          children: [
            Card(
              shadowColor: const Color(0xFF000000),
              color: Provider.of<ThemeModel>(context).scafColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              color: Colors.white,
                              height: 120.h,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      width: 38.w,
                                      height: 4.h,
                                      color: const Color(0xFF3C3C43),
                                    ),
                                    const Text(
                                      'Выберите язык',
                                      style: ConstStyle.settingstyle2,
                                    ),
                                    SizedBox(height: 10.h),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    kyrgyzcha();
                                                    setState(() {
                                                      selectedIndex =
                                                          0; // Обновление индекса выбранного элемента
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                    color: 0 == selectedIndex
                                                          ? const Color(
                                                            0xFFE6E6E6)
                                                        : const Color(0xFFC4C4CC),
                                                        borderRadius:const BorderRadius.only(topLeft:Radius.circular(6),
                                                        bottomLeft: Radius.circular(6))
                                                  ),
                                                    width: 175.w,
                                                    height: 26.h,
                                                    
                                                    child: const Center(
                                                      child: Text(
                                                        'Кыргызский',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ))),
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () {
                                                    russcha();
                                                    setState(() {
                                                      selectedIndex = 1;
                                                    });
                                                  },
                                                  child: Container(decoration: BoxDecoration(
                                                    color: 1 == selectedIndex
                                                          ? const Color(
                                                            0xFFE6E6E6)
                                                        : const Color(0xFFC4C4CC),
                                                        borderRadius:const BorderRadius.only(topRight:Radius.circular(6),
                                                        bottomRight: Radius.circular(6))
                                                  ),
                                                      width: 175.w,
                                                      height: 26.h,
                                                      
                                                      child: const Center(
                                                        child: Text(
                                                          'Русский',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ))))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8.w),
                  width: MediaQuery.of(context).size.width,
                  height: 76.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: const Color(0xFFF5F6F7),
                          child: Image.asset(
                              width: 20,
                              height: 17.86,
                              'assets/images/kitay.png')),
                      SizedBox(width: 10.w),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.language,
                            style: ConstStyle.settingstyle,
                          ),
                           Text(  selectedIndex == 0 ? 'Кыргызский' : 'Русский',)
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          height: 18.h,
                          width: 18.w,
                          child: Image.asset('assets/images/vpered1.png',color: themeProvider.vperediconCol,))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              shadowColor: const Color(0xFF000000),
              color: Provider.of<ThemeModel>(context).scafColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.all(8.w),
                width: MediaQuery.of(context).size.width,
                height: 76.h,
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: const Color(0xFFF5F6F7),
                        child: Image.asset(
                            width: 20,
                            height: 17.86,
                            'assets/images/kungfu.png')),
                    SizedBox(width: 10.w),
                    Text(AppLocalizations.of(context)!.theme,
                        style: ConstStyle.settingstyle),
                    const Spacer(),
                    CupertinoSwitch(
                      activeColor: const Color(0xFF545454),
                      thumbColor: Colors.white,
                      trackColor: Colors.black12,
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
    await prefs.setInt('index', selectedIndex);
  }
}

// List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> list) {
//   final List<DropdownMenuItem<String>> menuItems = [];
//   for (final String item in list) {
//     menuItems.addAll(
//       [
//         DropdownMenuItem<String>(
//           value: item,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4.0),
//             child: Text(
//               item,
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//         if (item != list.last)
//           const DropdownMenuItem<String>(
//             enabled: false,
//             child: Divider(),
//           ),
//       ],
//     );
//   }
//   return menuItems;
// }

// List<double> _getCustomItemsHeights() {
//   final List<double> itemsHeights = [];
//   for (int i = 0; i < (list.length * 2) - 1; i++) {
//     if (i.isEven) {
//       itemsHeights.add(40);
//     }
//     //Dividers indexes will be the odd indexes
//     if (i.isOdd) {
//       itemsHeights.add(4);
//     }
//   }
//   return itemsHeights;
// }

// class DropdownButtonExample extends StatefulWidget {
//   const DropdownButtonExample({super.key});

//   @override
//   State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
// }

// List<String> list = <String>["Русский", 'English', 'Кыргызча'];

// class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  // String selectedValue = 'English';

  // void loadlang() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     selectedValue = prefs.getString('language') ?? 'Русский';
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   loadlang();
  //   setState(() {});
  // }

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2<String>(
//         isExpanded: true,
//         items: _addDividersAfterItems(list),
//         value: selectedValue,
//         onChanged: (String? value) {
//           setState(() {
//             selectedValue = value!;
//             switch (selectedValue) {
//               case 'Русский':
//                 russcha();

//                 break;
//               case 'English':
//                 englishche();
//                 break;
//               case 'Кыргызча':
//                 kyrgyzcha();
//                 break;
//             }
//           });
//         },
//         buttonStyleData: const ButtonStyleData(
//           padding: EdgeInsets.symmetric(horizontal: 6),
//           height: 40,
//           width: 150,
//         ),
//         dropdownStyleData: const DropdownStyleData(
//           maxHeight: 200,
//         ),
//         menuItemStyleData: MenuItemStyleData(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           customHeights: _getCustomItemsHeights(),
//         ),
//         iconStyleData: const IconStyleData(
//           openMenuIcon: Icon(Icons.arrow_drop_up),
//         ),
//       ),
//     );
//   }

  // Future<void> russcha() async {
  //   sohr();
  //   setState(() {
  //     Provider.of<LocaleProvider>(context, listen: false)
  //         .setLocale(const Locale('ru'));
  //   });
  // }

  // Future<void> kyrgyzcha() async {
  //   sohr();
  //   setState(() {
  //     Provider.of<LocaleProvider>(context, listen: false)
  //         .setLocale(const Locale('ky'));
  //   });
  // }

  // Future<void> englishche() async {
  //   sohr();
  //   setState(() {
  //     Provider.of<LocaleProvider>(context, listen: false)
  //         .setLocale(const Locale('en'));
  //   });
  // }

  // Future<void> sohr() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('language', selectedValue);
  // }
// }
