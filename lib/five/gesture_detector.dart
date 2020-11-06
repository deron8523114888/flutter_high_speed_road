import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DetectorState();
}

class DetectorState extends State<Detector> {
  String text = "監聽範圍";

  int longPressSecond = 0;
  bool isLongPress = false;

  double top = 250.0;
  double left = 50.0;

  double width = 150.0;
  double height = 150.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            // 點擊一下
            onTap: tap,
            // 雙擊
            onDoubleTap: doubleTap,
            // 長按
            onLongPress: longPress,
            // 長按結束
            onLongPressEnd: (event) {
              longPressEnd();
            },
            // 按下的瞬間，callback 取得資訊，類似 listen 的滑鼠監聽
            onPanDown: (event) {
              panDown();
            },
            
            // 滑動 -> 縮放效果
            onPanUpdate: (event) {
              width += event.delta.dx;
              height += event.delta.dy;
              panUpdate();
            },
            // 進入【滑動】狀態後【彈起】=> 跟一般滑鼠彈起不同
            onPanEnd: (event) {
              panEnd();
            },
            // 垂直拖動 ( 拖動時不會偵測到【滑動】狀態 )
//              onVerticalDragUpdate: (event) {
//                top += event.delta.dy;
//                setState(() {});
//              },

//              onScaleUpdate: (event){
//
//              },

            // 水平拖動
//            onHorizontalDragUpdate: (event) {
//              left += event.delta.dx;
//            },

            child: Container(
              alignment: Alignment.center,
              width: width,
              height: height,
              color: Colors.blue,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }

  tap() {
    text = '單擊';
    setState(() {});
  }

  doubleTap() {
    text = '雙擊';
    setState(() {});
  }

  longPress() {
    isLongPress = true;
    text = '長按';
    CountDownTimer();
    setState(() {});
  }

  longPressEnd() {
    isLongPress = false;
    text = '長按取消';
    setState(() {});
  }

  panDown() {
    longPressSecond = 0;
    text = '按下瞬間';
    setState(() {});
  }

  panUpdate() {
    text = '滑動中';
    setState(() {});
  }

  panEnd() {
    text = '滑動後彈起';
    setState(() {});
  }

  /// 長按的異步線程
  Future<String> CountDownTimer() async {
    while (isLongPress) {
      print(longPressSecond);
      longPressSecond++;
      text = '長按：$longPressSecond秒';
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
