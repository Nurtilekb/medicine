import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/app/providers/locale_providers.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:medicine1/widgets/favorite_list.dart';
import 'package:medicine1/widgets/listview_bld.dart';
import 'package:medicine1/widgets/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/card_model.dart';
import 'widgets/articles_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => ThemeModel()),
    ChangeNotifierProvider(create: (BuildContext context) => LocaleProvider()),
    ChangeNotifierProvider(
        create: (BuildContext context) => Listbeck()..filterData('keyword')),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocaleProvider>(context, listen: false).loadLocale();
      Provider.of<ThemeModel>(context, listen: false).loadTheme();
      Provider.of<Listbeck>(context, listen: false).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Provider.of<LocaleProvider>(context).locale,
            theme: themeModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
            home: Scaffold(
              bottomNavigationBar: NavBarr(
                selectedIndex: _selectedIndex,
                onitemtap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
              body: IndexedStack(
                index: _selectedIndex,
                children: const [
                  ListTabview(),
                  FavList(),
                  ArcticList(),
                  SettingList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NavBarr extends StatefulWidget {
  const NavBarr(
      {super.key, required this.selectedIndex, required this.onitemtap});

  @override
  State<NavBarr> createState() => _NavBarrState();
  final int selectedIndex;
  final Function(int) onitemtap;
}

class _NavBarrState extends State<NavBarr> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        backgroundColor: Provider.of<ThemeModel>(context).navbColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF03AF44),
        unselectedItemColor: Colors.grey,
        currentIndex: widget.selectedIndex,
        onTap: widget.onitemtap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 18.w,
              height: 21.h,
              child: Image.asset(
                widget.selectedIndex == 0
                    ? 'assets/images/jilan2.png'
                    : 'assets/images/jilan1.png',
                fit: BoxFit.cover,
              ),
            ),
            label: AppLocalizations.of(context)?.home1 ?? 'home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              height: 18.75.h,
              width: 13.5.w,
              child: Image.asset(
                widget.selectedIndex == 1
                    ? 'assets/images/sohr2.png'
                    : 'assets/images/sohr.png',
                fit: BoxFit.cover,
              ),
            ),
            label: AppLocalizations.of(context)?.favorites ?? 'favorites',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 18.w,
              height: 18.75.h,
              child: Image.asset(
                widget.selectedIndex == 2
                    ? 'assets/images/kitep2.png'
                    : 'assets/images/kitep.png',
                fit: BoxFit.cover,
              ),
            ),
            label: AppLocalizations.of(context)?.articles ?? 'articles',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 19.62.w,
              height: 19.62.h,
              child: Image.asset(
                widget.selectedIndex == 3
                    ? 'assets/images/nastroyki2.png'
                    : 'assets/images/nastroyki.png',
                fit: BoxFit.cover,
              ),
            ),
            label: AppLocalizations.of(context)?.settings ?? 'settings',
          ),
        ],
      ),
    );
  }
}
