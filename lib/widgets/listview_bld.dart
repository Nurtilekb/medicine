import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicine1/model/them_model.dart';
import 'package:medicine1/ontapWidgets/descrip_bolezn.dart';
import 'package:provider/provider.dart';


import '../costants/text_style.dart';
import '../model/card_model.dart';
import 'search_name_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListTabview extends StatefulWidget {
  const ListTabview({super.key});

  @override
  State<ListTabview> createState() => _ListTabviewState();
}

class _ListTabviewState extends State<ListTabview> {
  
  
  @override
  Widget build(BuildContext context) {
    final pr = Provider.of<Listbeck>(context).mymodel;
    final colors=Provider.of<ThemeModel>(context);

    return Scaffold(backgroundColor: colors.scafColor,
      appBar: AppBar(scrolledUnderElevation:0,elevation: 0,backgroundColor:colors.scafColor,
        toolbarHeight: 140.h,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top: 22.h,bottom: 22.h,left:0.w),
                width: 164.w,
                height: 36.h,
                child: Text(
                   AppLocalizations.of(context)!.home1,
                  style:ConstStyle.vverh
                )),
            SearchBar1(
              onTextChanged: _runFilter,
            ),SizedBox(height: 10.h,)
          ],
        ),
      ),
      body: RefreshIndicator(
       displacement:200,
        onRefresh: _refreshData,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ListView.builder(
              itemCount: pr.length,
              itemBuilder: (BuildContext context, int index) {
                final item = pr[index];
                return Column(children: [
                  Card(
                      shadowColor: const Color(0xFF000000),
                      color: Provider.of<ThemeModel>(context).cardColor,
                  
                      elevation: 5,
                      shape: RoundedRectangleBorder(side: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      key: Key(item.id),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dopkaprobolez(
                            text1: item.glavtext,
                            imagepath: item.imagePath,
                            text2: item.doptext,
                            selectedIndex: index,
                          ),
                        ));
                  },
                              child: Container(
                                                        
                                width: 358.w,
                                height: 87.h,
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      item.imagePath,
                                      height: 50.h,
                                      width: 50.w,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.glavtext,
                                            style: ConstStyle.nazvbolez,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 3.h),
                                          Text(
                                            item.doptext,
                                            style: ConstStyle.descripbolez,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dopkaprobolez(
                                        text1: item.glavtext,
                                        imagepath: item.imagePath,
                                        text2: item.doptext,
                                        selectedIndex: index,
                                      ),
                                    ));
                              },
                              icon: SizedBox(
                                  height: 18.h,
                                  width: 18.w,
                                  child:
                                      Image.asset('assets/images/vpered1.png',color: colors.vperediconCol,)))
                        ],
                      )),SizedBox(height: 4.h)
                ]);
              },
            )),
      ),
    );
  }
Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 3)); // Симуляция сетевого запроса
    setState(() {
      Provider.of<Listbeck>(context, listen: false).filterData('');
      setState(() {
        
      });
    });
  }
  void _runFilter(String keyword) {
    Provider.of<Listbeck>(context, listen: false).filterData(keyword);
  }
}
