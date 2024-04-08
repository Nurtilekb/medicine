import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/card_model.dart';

import 'package:medicine1/widgets/favorite_list.dart';
import 'package:medicine1/widgets/listview_bld.dart';
import 'package:medicine1/widgets/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ThemeModel()),
        ChangeNotifierProvider(create: (BuildContext context) => CardModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child:
           Consumer<ThemeModel>(
            builder: (context, themeModel, child) {
              return MaterialApp(
                theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
                home: Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    fixedColor: Colors.black,
                    backgroundColor: themeModel.isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
                    currentIndex: _selectedIndex,
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Дом',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.star),
                        label: 'Сохраненные',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.table_view),
                        label: 'Статьи',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Настройки',
                      ),
                    ],
                  ),
                  body: IndexedStack(
                    index: _selectedIndex,
                    children: const [
                      ListTabview(),
                      FavList(),
                      Center(child: Text('wefviejfni')),
                      SettingList(),
                    ],
                  ),
                ),
              );
            },
          ),));}
        }
      
    

