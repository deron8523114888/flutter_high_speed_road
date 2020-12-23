import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TurnOverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TurnOverPageState();
}

class TurnOverPageState extends State<TurnOverPage>
    with TickerProviderStateMixin {
  bool isAnimating = true;

  /// 翻牌子數值設定 ( 調整後需要重進頁面，hotreload 沒用)
  // 文字
  int value = 100;

  // 文字大小
  double textSize = 70.0;

  // 延遲速度 (milliseconds) -> 數值越大越慢
  int speed = 500;

  // 翻開的控制器
  AnimationController openController;

  // 蓋上的控制器
  AnimationController closeController;

  @override
  dispose() {
    openController.dispose();
    closeController.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              startBtn(),
              Stack(
                children: [
                  pageBackgroundPart(),
                  pageAnimatedPart(),
                ],
              ),
            ],
          )),
    );
  }

  Container startBtn() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      alignment: Alignment.center,
      height: 40,
      child: FlatButton(
        onPressed: () {
          if (isAnimating) {
            openController.stop(canceled: true);
            closeController.stop(canceled: true);
            isAnimating = false;
          } else {
            /// 暫停後繼續
            /// 若 open 動畫已經結束 -> openController.forward() 不會有反應 (由於沒 reset)
            /// 若 open 已經結束 -> 才繼續執行 close 動畫
            openController.forward();
            if (openController.isCompleted) {
              closeController.forward();
            }
            isAnimating = true;
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Text(
            '開始/暫停',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Column pageAnimatedPart() {
    /// 翻開動畫設定
    openController = AnimationController(
        vsync: this, duration: Duration(milliseconds: speed));
    var openAnimation = Tween(begin: 0.0, end: pi / 2).animate(openController);

    /// 蓋上動畫設定
    closeController = AnimationController(
        vsync: this, duration: Duration(milliseconds: speed));
    var closeAnimation =
        Tween(begin: -pi / 2, end: 0.0).animate(closeController);
    closeAnimation.addListener(() {
      if (closeAnimation.isCompleted) {
        value++;
        if(value > 999){
          value = 0;
        }
        setState(() {});
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// 蓋下
        AnimatedBuilder(
          animation: closeAnimation,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, -0.004)
                ..rotateX(closeAnimation.value),
              alignment: FractionalOffset.bottomCenter,
              child: child,
            );
          },
          child: ClipRect(
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 0.5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Text(
                  (value + 1).toString(),
                  style: TextStyle(fontSize: textSize, color: Colors.yellow),
                ),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(0.5)),

        /// 翻開
        AnimatedBuilder(
          animation: openAnimation,
          builder: (context, child) {
            openController.forward();
            if (openAnimation.isCompleted) {
              closeController.forward();
            }
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, -0.004)
                ..rotateX(openAnimation.value),
              alignment: FractionalOffset.topCenter,
              child: child,
            );
          },
          child: ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: 0.5,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Text(
                  value.toString(),
                  style: TextStyle(fontSize: textSize, color: Colors.yellow),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column pageBackgroundPart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRect(
          child: Align(
            /// 取得上半部文字
            alignment: Alignment.topCenter,
            heightFactor: 0.5,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Text(
                value.toString(),
                style: TextStyle(fontSize: textSize, color: Colors.yellow),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(0.5)),
        ClipRect(
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.5,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Text(
                (value + 1).toString(),
                style: TextStyle(fontSize: textSize, color: Colors.yellow),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
