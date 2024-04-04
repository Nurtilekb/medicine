import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/card_model.dart';

import 'package:medicine1/widgets/favorite_list.dart';
import 'package:medicine1/widgets/listview_bld.dart';
import 'package:provider/provider.dart';

import 'widgets/search_tme.dart';
import 'widgets/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isDarkMode = false;

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>CardModel(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Scaffold(
            appBar: AppBar(
              toolbarHeight: 65,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton.outlined(
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                  icon: Icon(
                      isDarkMode ? Icons.wb_sunny : Icons.dark_mode_outlined),
                ),
              ],
              backgroundColor:
                  isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
              title: const SearchBar1(),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              backgroundColor:
                  isDarkMode ? Colors.blueGrey : Colors.blueGrey[200],
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
                SettingList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
