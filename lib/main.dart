import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highspeedroad/fragment/One.dart';
import 'Main/main.dart';
import 'fragment/Five.dart';
import 'fragment/Four.dart';
import 'fragment/Three.dart';
import 'fragment/Two.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 設置狀態欄的背景色 ( 時間、電量 )
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      /// 文字
      value: SystemUiOverlayStyle.light,
      child: MaterialApp(
        /// 右上角 debug icon
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: _MyHomePageState(),
      ),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(209, 209, 209, 1),
        resizeToAvoidBottomInset: false,

        /// fragment 五個畫面
        body: TabBarView(
          children: [One(), Two(), Three(context), Four(), Five()],
        ),

        /// 下方列表
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          alignment: Alignment.center,
          child: TabBar(
            tabs: tabList.map((choice) {
              return Container(
                child: Column(
                  children: [
                    Icon(
                      choice.icon,
                      size: 24,
                    ),
                    Text(
                      choice.title,
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              );
            }).toList(),
            indicatorColor: Colors.transparent,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}

/// tabBar 寫法
class TabChoice {
  final String title;
  final IconData icon;

  const TabChoice(this.title, this.icon);
}

const List<TabChoice> tabList = const <TabChoice>[
  TabChoice('我的車票', Icons.share),
  TabChoice('訂票', Icons.laptop_chromebook),
  TabChoice('付款/取票', Icons.school),
  TabChoice('擷取紀錄', Icons.book),
  TabChoice('功能', Icons.settings),
];

