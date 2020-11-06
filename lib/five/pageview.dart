
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewPager extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ViewPagerState();

}

class ViewPagerState extends State<ViewPager>{

  final controller = PageController(
    /// 預設畫面的 index => 對照 PageView 的 children
    /// 若小於 0，則視為 0 (第一個畫面)
    /// 若大於 children 數量，則視為最大 index ( 最後一個畫面 )
    initialPage: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        /// 可控制【垂直滑動】【水平滑動】
        scrollDirection: Axis.vertical,
        children: [
          page1(),
          page2(),
          page3()
        ],
      ),
    );
  }

  Center page1 (){
    return Center(
      child: Text(
        '這是Page1',
        style: TextStyle(
            fontSize: 22,
            color: Colors.black
        ),
      ),
    );
  }
  Center page2 (){
    return Center(
      child: Text(
        '這是Page2',
        style: TextStyle(
            fontSize: 22,
            color: Colors.black
        ),
      ),
    );
  }
  Center page3 (){
    return Center(
      child: Text(
        '這是Page3',
        style: TextStyle(
            fontSize: 22,
            color: Colors.black
        ),
      ),
    );
  }

}