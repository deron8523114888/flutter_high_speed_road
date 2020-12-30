import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/Animation.dart';
import 'package:highspeedroad/dialog/ticket_manager_dialog.dart';
import 'package:highspeedroad/five/color_filtered.dart';
import 'package:highspeedroad/five/cupertino_action_sheet.dart';
import 'package:highspeedroad/five/custom_paint.dart';
import 'package:highspeedroad/five/dialog_page.dart';
import 'package:highspeedroad/five/dismissible.dart';
import 'package:highspeedroad/five/draggable_scrollable_sheet.dart';
import 'package:highspeedroad/five/drawer.dart';
import 'package:highspeedroad/five/http_request.dart';
import 'package:highspeedroad/five/progress.dart';
import 'package:highspeedroad/five/pageview.dart';
import 'package:highspeedroad/five/sliver_app_bar.dart';
import 'package:highspeedroad/five/state_test.dart';
import 'package:highspeedroad/five/take_photo_gallery.dart';
import 'package:highspeedroad/five/timer.dart';
import 'package:highspeedroad/five/transform.dart';
import 'package:highspeedroad/five/transition.dart';
import 'package:highspeedroad/five/value_listenable.dart';
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
  ValueNotifier<String> name = ValueNotifier<String>('');
  dynamic ctx;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isShowSnackBar = false;

  bool isClick = false;

  int stateNum = 0;
  ValueNotifier<int> valueStateNum = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    ctx = context;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(212, 212, 212, 1),

      /// AbsorbPointer 可以控制底下所有【點擊事件】
      /// true -> 不可點擊
      /// false -> 可點擊
      body: AbsorbPointer(
        absorbing: false,

        /// 一般寫法
        child: ListView.builder(
          itemCount: setttingList.length,
          itemBuilder: (context, index) {
            return itemView(index);
          },
        ),

        /// 加上每個 item 之間的 widget
//        child: ListView.separated(
//          itemCount: setttingList.length,
//          itemBuilder: (context, index) {
//            return itemView(index);
//          },
//          separatorBuilder: (s1,s2) => line(),
//        ),
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
            /// 每個 item 包著 Tooltip
            Tooltip(
              /// 按著會顯示內容
              message: setttingList[index].message,
              height: 50.0,

              /// 顯示位置 false -> 上方 ， true ->　下方
              preferBelow: false,

              /// 和 child 的距離
              verticalOffset: 40.0,
              child: Row(
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
            ),
            line()
          ],
        ),
        onPressed: () {
          switch (index) {
            case 0:
              snackbar(ctx);
              break;
            case 13:
              valueListenable(ctx, name);
              break;
            case 18:
              stateTest(context, stateNum, valueStateNum, () {
                setState(() {});
              });
              break;
            default:
              setttingList[index].click(ctx);
              break;
          }
        },
      ),
    );
  }

  ///  功能列表
  List<SettingItem> setttingList = <SettingItem>[
    /// 自訂 Snackbar 的 UI
    SettingItem(Icons.chat_bubble_outline, 'SnackBar', () {}, "客製化 SnackBar"),

    /// 控制物件的 【絕對座標】
    SettingItem(Icons.access_time, 'listen 絕對座標控制物件', animationListen,
        "利用 Stack 疊加三個部件，並利用 Listener 計算座標的效果"),

    /// Http 請求，利用 async && await
    SettingItem(
        Icons.attach_money, 'Http請求 async await', futureBuilder, "Http 請求"),

    /// 自訂 Dialog
    SettingItem(
        Icons.party_mode, 'Dialog', ticketManage, "效仿高鐵的【票券整理] 顯示的 Dialog"),

    /// PageView ( 滑動功能，類似 Android 的 ViewPager )
    SettingItem(Icons.content_copy, 'ViewPager', pageView,
        "Android 的 ViewPager，可控制無法滑動利用點擊切換"),

    /// Table ( 避免 Column + Row 的寫法 )
    SettingItem(Icons.assignment, 'Table', showTable,
        "利用 Table 展示表格資料，還有更進階的表格為 DataTable 效果、功能類似資料庫(排序..)"),

    /// GestureDetector 監聽
    SettingItem(Icons.notifications_active, 'GestureDetector 監聽',
        gestureDetector, "針對某個 Widget 設置多個監聽，包含【點擊】【雙擊】【按著】【按下】【彈起】【滑動】等等"),

    /// SliverAppBar
    SettingItem(
        Icons.person, 'SliverAppBar', sliverAppBar, "可滑動的 AppBar，以及 Gridview"),

    /// FadeImage 加載圖片 URL
    SettingItem(Icons.airline_seat_recline_extra, 'FadeInImage', fadeInImage,
        "加載本地或 URL 圖片"),

    /// async* Stream yield 異步處理 【假的 API 請求】
    SettingItem(
        Icons.settings, 'async* Stream yield', otherSetting, "多個異步處理方式，詳細看 MD"),

    /// CustomPainter ( Paint & canvas )
    /// 【五子棋】
    SettingItem(Icons.assignment_late, 'CustomPainter 五子棋', customPaint,
        "用【畫佈】和【筆】畫出來，加上一些邏輯處理的小遊戲"),

    /// Transform ( Widget 轉換 )
    SettingItem(
        Icons.assignment, 'Transform', transform, "多種靜態轉換 or 動畫+轉換，有翻頁的小成品"),

    /// Dismissible ( 類似 line 【右滑釘選】【左滑刪除】功能 )
    SettingItem(Icons.help_outline, 'Dismissible 釘選、刪除', dismissible, "同標題"),

    SettingItem(Icons.train, 'ManyOption', valueListenable, "類似 DataBinding"),

    SettingItem(Icons.content_copy, 'DraggableScrollableSheet',
        draggableScrollableSheet, "可從底部滑出的畫面"),

    SettingItem(
        Icons.content_copy, 'ColorFiltered', colorFiltered, "正確的圖片上色方法"),

    SettingItem(
        Icons.content_copy, 'CupertinoActionSheet', cupertinoActionSheet, ""),

    SettingItem(Icons.content_copy, 'Progress', progress, ""),

    SettingItem(Icons.content_copy, 'stateTest', stateTest, ""),

    SettingItem(Icons.content_copy, 'Draw', drawer, ""),

    SettingItem(Icons.content_copy, 'Animate Dialog', animateDialog, ""),

    SettingItem(Icons.content_copy, 'Transition', transition, ""),

    SettingItem(Icons.content_copy, '相機、相簿使用', gallery, ""),

    SettingItem(Icons.content_copy, '倒數計時器', timer, ""),
  ];

  snackbar(BuildContext context) {
    var controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    Animation animation = Tween(begin: 0.0, end: 100.0).animate(controller);

    if (!isShowSnackBar) {
      name.value = 'snackbar';

      isShowSnackBar = true;
      Scaffold.of(context)
          .showSnackBar(
            SnackBar(
              /// 【背景顏色】
              backgroundColor: Colors.white,

              /// 【持續時間】
              duration: Duration(seconds: 200),

              /// 【顯示方式】
              /// floating -> 不貼底部，浮出
              /// fixed -> 緊貼底部，彈出
              behavior: SnackBarBehavior.floating,

              animation: animation,

              /// 【形狀】 -> 圓角矩形
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),

              /// 【右側按鈕】，按下後會自動關閉 SnackBar
              action: SnackBarAction(
                textColor: Colors.orange,
                label: "Action",
                onPressed: () {
                  print('Click Action');
                },
              ),

              /// 【內容】 Widget
              content: Wrap(
                children: [
                  Center(
                    child: Text(
                      '成  功',
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),

            /// 監聽 SnackBar 關閉後的回調
          )
          .closed
          .then((value) {
        print(value);
        isShowSnackBar = false;
      });
    }
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
  final String message;

  SettingItem(this.icon, this.title, this.click, this.message);
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

customPaint(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => CustomP()));
}

transform(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Trans()));
}

dismissible(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Dismiss()));
}

valueListenable(BuildContext context, ValueNotifier name) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ManyOption(name)));
}

draggableScrollableSheet(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DraggableScroll()));
}

colorFiltered(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ImageColor()));
}

cupertinoActionSheet(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Cupertino()));
}

progress(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Progress()));
}

stateTest(BuildContext context, int stateNum, ValueNotifier valueStateNum,
    Function() refresh) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StateTest(stateNum, valueStateNum, refresh)));
}

drawer(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyDrawer()));
}

animateDialog(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => DialogPage()));
}

transition(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Transition()));
}

gallery(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Gallery()));
}

timer(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CountDownTimer()));
}

empty() {}
