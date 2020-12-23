import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ViewPagerState();
}

class ViewPagerState extends State<ViewPager> {
  final controller = PageController(
    /// 預設畫面的 index => 對照 PageView 的 children
    /// 若小於 0，則視為 0 (第一個畫面)
    /// 若大於 children 數量，則視為最大 index ( 最後一個畫面 )
    initialPage: 0,

    /// 每一個 Page 顯示的大小占螢幕的寬度比例
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: 400,
          child: PageView(
            controller: controller,

            /// 可控制【垂直滑動】【水平滑動】
            // scrollDirection: Axis.vertical,
            /// 控制是否可滑動
//        physics: NeverScrollableScrollPhysics(),
            children: [
              page1(Colors.blue),
              page1(Colors.red),
              page1(Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }

  page1(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: color, width: 20)),
        child: FlatButton(
          onPressed: () {
            controller.animateToPage(1,
                duration: Duration(seconds: 1), curve: Curves.linear);
          },
          child: Text(
            '這是Page',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ));
  }

  page2() {
    return Center(
      child: Text(
        '這是Page2',
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }

  page3() {
    return Center(
      child: Text(
        '這是Page3',
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }
}
