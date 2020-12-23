import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/five/transform/turn_over_page.dart';

/// 每一個 Transform 搭配 AnimatedBuilder 改為動畫轉換
class Trans extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransState();
}

class TransState extends State<Trans> with TickerProviderStateMixin {

  bool isAnimating = false;

  /// 翻牌子數值設定 ( 調整後需要重進頁面，hotreload 沒用)
  // 文字
  int value = 0;

  // 文字大小
  double textSize = 60.0;

  // 延遲速度 (milliseconds) -> 數值越大越慢
  int speed = 500;

  // 翻開的控制器
  AnimationController openController;

  // 蓋上的控制器
  AnimationController closeController;

  final key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    '動畫開始/停止',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        delegate: SliverChildListDelegate(
                          [

                            /// 【旋轉】
                            staticRotate(),
                            animatedRotate(),

                            /// 【縮放】
                            scale(),
                            animatedScale(),

                            /// 【移動】
                            translate(),
                            animatedTranslate(),

                            /// 【延伸】底部或右側 ( skewX skewY skew )
                            skew(),
                            animatedSkew(),

                            /// 【縮放】 利用三維座標軸
                            diagonal3Values(),
                            animatedDiagonal3Values(),

                            /// 【繞 X 軸翻轉】
                            rotateToX(),

                            /// 【繞 Y 軸翻轉】
                            rotateToY(),

                            /// 【翻頁動畫】
                            TurnOverPage(),

                            /// 也是縮放用
//                            SizeTransition(
//                              sizeFactor: animation,
//                              child: Container(
//                                width: double.infinity,
//                                height: 81,
//                                child: Column(
//                                  children: [
//                                    Expanded(
//                                      child: Text('回程時間'),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Container staticRotate() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform.rotate(
        angle: pi / 4,
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container animatedRotate() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    var animation = Tween(begin: 0, end: 2 * pi).animate(controller);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.rotate(
              angle: animation.value.toDouble(), child: child);
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container scale() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform.scale(
        scale: 1.5,
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container animatedScale() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    var animation = Tween(begin: 1.0, end: 0.0).animate(controller);
    return Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(scale: animation.value, child: child);
          },
          child: Icon(
            Icons.sports_baseball,
            size: 60,
          ),
        ));
  }

  Container translate() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform.translate(

        /// X 往右方向為正，Y 往下方向為正
        offset: Offset(40, 40),
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container animatedTranslate() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..repeat();
    var animation = Tween(begin: 0.0, end: 40).animate(controller);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(animation.value, animation.value), child: child);
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container skew() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform(

        /// 調整 skew( X 延伸自身 width 的倍數, Y 延伸自身 height 的倍數 )
        /// 正倍數 -> 向 右 和 下
        /// 負倍數 -> 向 左 和 上
        transform: Matrix4.skew(0.4, 0),
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container animatedSkew() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 1))
      ..repeat();
    var animation = Tween(begin: 0.0, end: 0.5).animate(controller);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(

            /// skew( X 延伸自身 width 的倍數, Y 延伸自身 height 的倍數 )
            /// X 向右為正，Y 向下為正
            transform: Matrix4.skew(animation.value, 0),
            child: child,
          );
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container diagonal3Values() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform(

        /// x y 變形倍數
        transform: Matrix4.diagonal3Values(0.5, 1.5, 1),
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container animatedDiagonal3Values() {
    // Todo 動畫 X 結束再執行 動畫 Y
    var controllerX =
    AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..repeat();
    var animationX = Tween(begin: 1.0, end: 0.5).animate(controllerX);

    var controllerY =
    AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..repeat();
    var animationY = Tween(begin: 1.0, end: 1.5).animate(controllerY);

    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animationX,
        builder: (context, child) {
          return Transform(

            /// x y 變形倍數
              transform: Matrix4.diagonal3Values(
                  animationX.value, animationY.value, 1),
              child: child);
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container rotateToX() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    var animation = Tween(begin: 0.0, end: 2 * pi).animate(controller);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.03)
                ..rotateX(animation.value),
              alignment: FractionalOffset.center,
              child: child);
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container rotateToY() {
    var controller =
    AnimationController(vsync: this, duration: Duration(seconds: 3))
      ..repeat();
    var animation = Tween(begin: 0.0, end: 2 * pi).animate(controller);
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.03)
                ..rotateY(animation.value),
              alignment: FractionalOffset.center,
              child: child);
        },
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

}
