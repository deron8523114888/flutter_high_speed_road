import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/RSGAMES-2/AndroidStudioProjects/highspeedroad/lib/fourpage/page2.dart';
import 'package:highspeedroad/fourpage/page1.dart';

class Four extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FourState();
  }
}

class FourState extends State<Four> {

  bool pageOneVisible = true;
  bool pagetwoVisible = false;

  final controller = PageController(

    /// 預設畫面的 index => 對照 PageView 的 children
    /// 若小於 0，則視為 0 (第一個畫面)
    /// 若大於 children 數量，則視為最大 index ( 最後一個畫面 )
      initialPage: 0
  );

  bool state = true;
  PageOne pageOne;
  PageTwo pageTwo;

  @override
  Widget build(BuildContext context) {


    return PageView(
      controller: controller,

      /// 可控制【垂直滑動】【水平滑動】
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      children: [
        PageOne(toPageTwo,pageOneVisible),
        PageTwo(toPageOne,pagetwoVisible)
      ],
    );
  }

  toPageTwo(){
    controller.animateToPage(
      1,
      duration: Duration(milliseconds: 400),
      curve: Curves.linear,
    );
    pageOneVisible = false;
    pagetwoVisible = true;
    setState(() {});
  }

  toPageOne(){
    controller.animateToPage(
      0,
      duration: Duration(milliseconds: 400),
      curve: Curves.linear,
    );
    pageOneVisible = true;
    pagetwoVisible = false;
    setState(() {});
  }



}


toast(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
