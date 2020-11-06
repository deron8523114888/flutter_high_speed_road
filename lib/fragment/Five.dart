import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/Animation.dart';
import 'package:highspeedroad/dialog/ticket_manager_dialog.dart';
import 'package:highspeedroad/five/custom_paint.dart';
import 'package:highspeedroad/five/http_request.dart';
import 'package:highspeedroad/five/pageview.dart';
import 'package:highspeedroad/five/sliver_app_bar.dart';
import 'file:///C:/Users/RSGAMES-2/AndroidStudioProjects/highspeedroad/lib/five/animation_listen.dart';
import 'file:///C:/Users/RSGAMES-2/AndroidStudioProjects/highspeedroad/lib/five/other_setting.dart';
import '../five/fade_image.dart';
import '../five/gesture_detector.dart';
import '../five/table.dart';

class Five extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FiveState();
  }
}

class FiveState extends State<Five> with SingleTickerProviderStateMixin {
  dynamic ctx;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    ctx = context;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(212, 212, 212, 1),
      body: ListView.builder(
        itemCount: setttingList.length,
        itemBuilder: (context, index) {
          return itemView(index);
        },
      ),
    );
  }

  /// 每一項 ItemView
  Container itemView(int index) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      child: FlatButton(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    setttingList[index].icon,
                    size: 40,
                    color: Colors.orange,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    setttingList[index].title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            line()
          ],
        ),
        onPressed: () {
          setttingList[index].click(ctx);
        },
      ),
    );
  }
}

Container line() {
  return Container(
      height: 1, margin: EdgeInsets.only(top: 10), color: Colors.grey);
}

class SettingItem {
  final IconData icon;
  final String title;
  final Function click;

  SettingItem(this.icon, this.title, this.click);
}

///  功能列表
///  Todo 丟入 click Function
List<SettingItem> setttingList = <SettingItem>[
  /// 自訂 Snackbar 的 UI
  SettingItem(Icons.chat_bubble_outline, 'SnackBar', snackbar),

  /// 控制物件的 【絕對座標】
  SettingItem(Icons.access_time, 'listen 絕對座標控制物件', animationListen),

  /// Http 請求，利用 async && await
  SettingItem(Icons.attach_money, 'Http請求 async await', futureBuilder),

  /// 自訂 Dialog
  SettingItem(Icons.party_mode, 'Dialog', ticketManage),

  /// PageView ( 滑動功能，類似 Android 的 ViewPager )
  SettingItem(Icons.content_copy, 'ViewPager', pageView),

  /// Table ( 避免 Column + Row 的寫法 )
  SettingItem(Icons.assignment, 'Table', showTable),

  /// GestureDetector 監聽
  SettingItem(
      Icons.notifications_active, 'GestureDetector 監聽', gestureDetector),

  /// SliverAppBar
  SettingItem(Icons.person, 'SliverAppBar', sliverAppBar),

  /// FadeImage 加載圖片 URL
  SettingItem(Icons.airline_seat_recline_extra, 'FadeInImage', fadeInImage),

  /// async* Stream yield 異步處理 【假的 API 請求】
  SettingItem(Icons.settings, 'async* Stream yield', otherSetting),

  /// CustomPainter ( Paint & canvas )
  /// 【五子棋】
  SettingItem(Icons.assignment_late, 'CustomPainter 五子棋', customPaint),


  SettingItem(Icons.assignment, '空', empty),
  SettingItem(Icons.help_outline, '空', empty),
  SettingItem(Icons.train, '空', empty),
  SettingItem(Icons.content_copy, '空', empty),
];

snackbar(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      duration: Duration(milliseconds: 500),
      content: Wrap(
        children: [
          Container(
            child: Text(
              '成功',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
          )
        ],
      ),
    ),
  );
}

animationListen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AnimationListen()),
  );
}

futureBuilder(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HttpReq()));
}

ticketManage(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final phoneWidth = size.width;
  final phoneHeight = size.height;

  showDialog(
    context: context,
    builder: (ctx) {
      return TicketDialog(phoneWidth, phoneHeight, ctx);
    },
  );
}

pageView(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPager()));
}

showTable(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyTable()));
}

otherSetting(BuildContext context) {
  Navigator.push(
    context,
    SlideLeftAnimation(builder: (context) => OtherSetting()),
  );
}

gestureDetector(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Detector()));
}

sliverAppBar(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CustomAppBar()));
}

fadeInImage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FadeImage()));
}

customPaint(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomP()));
}

empty() {}
