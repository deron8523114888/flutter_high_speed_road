import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Matrix4 ( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,) 代表 4X4 矩陣
/// 1~4 [ X 縮放, y延長, XX, XX ]
/// 5~8 [ X 延長, Y 縮放, XX, XX ]
/// 9~12 [ XX, XX, Z 縮放, XX ]
/// 13~16 [ x平移, y平移, z平移, 縮小倍數(負數會上下左右顛倒) ]

/// 縮放至少要 1 才會有圖 => (1,0,0,0, 0,1,0,0, 0,0,0,0, 0,0,0,1)

class Trans extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransState();
}

class TransState extends State<Trans> {
  double rotateValue = 0;

  bool animationControll = false;

  bool direction = true;

  int value = 0;

  /// 翻牌子數值設定
  // 70 可顯示 1 位數
  // 60 可顯示 2 位數
  double textSize = 60.0;
  // 翻牌延遲速度 (microSec) -> 數值越大越慢
  int speed = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                FlatButton(
                  onPressed: () {
                    animationControll = !animationControll;
                    startrotation();
                  },
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
                            crossAxisCount: 3),
                        delegate: SliverChildListDelegate(
                          [
                            /// 旋轉
                            rotate(),

                            /// 縮放
                            scale(),

                            /// 移動
                            /// X 往右方向為正，Y 往下方向為正
                            translate(),

                            /// 【延長】底部或右側 ( skewX skewY skew )
                            skew(),

                            /// 【縮放】 利用三維座標軸
                            diagonal3Values(),

                            /// 【繞 X 軸翻轉】
                            rotateToX(),

                            /// 【繞 Y 軸翻轉】
                            rotateToY(),

                            /// 【翻頁動畫】
                            page(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }

  Container rotate() {
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

  Container translate() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform.translate(
        offset: Offset(20, 20),
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
        transform: Matrix4.skew(0.3, 0),
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
        transform: Matrix4.diagonal3Values(0.5, 1.4, 1),
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container rotateToX() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.03)
          ..rotateX(rotateValue),
        alignment: FractionalOffset.center,
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  Container rotateToY() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.03)
          ..rotateY(rotateValue),
        alignment: FractionalOffset.center,
        child: Icon(
          Icons.sports_baseball,
          size: 60,
        ),
      ),
    );
  }

  page() {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        child: Stack(
          children: [pageBackgroundPart(), pageAnimationPart()],
        ),
      ),
    );
  }

  startrotation() async {
    while (animationControll) {
      await Future.delayed(Duration(microseconds: speed));
      rotateValue += pi / 180;

      /// 【翻開】 角度為 ： 0 -> pi/2
      if (direction && rotateValue >= pi / 2) {
        direction = false;
        rotateValue = -pi / 2;
      }

      /// 【蓋上】 角度為 : -pi/2 -> 0
      if (!direction && rotateValue >= 0) {
        value++;
        if(value == 99) value = 0 ;
        direction = true;
        rotateValue = 0;
        await Future.delayed(Duration(milliseconds: 100));
      }
      setState(() {});
    }
  }

  Column pageAnimationPart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, -0.004)
            ..rotateX(direction ? pi / 2 : rotateValue),
          alignment: FractionalOffset.bottomCenter,
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
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, -0.004)
            ..rotateX(direction ? rotateValue : pi / 2),
          alignment: FractionalOffset.topCenter,
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
              width: 80,
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
              width: 80,
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
