import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimationListen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationListenState();
}

class AnimationListenState extends State<AnimationListen> {
  // 起始點
  double brownX = 100.0;
  double brownY = 100.0;
  double redX = 150.0;
  double redY = 150.0;
  double greenX = 200.0;
  double greenY = 200.0;

  // 【點擊的座標】和【物件左上角座標】的差距
  var brownXDifferent ;
  var brownYDifferent ;
  var redXDifferent ;
  var redYDifferent ;
  var greenXDifferent ;
  var greenYDifferent ;

  // 是否點擊到該物件 ( 若疊加時，只針對最上層物件做移動 )
  bool isBrown = false;
  bool isRed = false;
  bool isGreen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Listener(
      behavior: HitTestBehavior.opaque,

      /// 按下監聽
      onPointerDown: (event) {
        brownXDifferent = event.position.dx - brownX;
        brownYDifferent = event.position.dy - brownY;

        if (brownXDifferent > 0 && brownXDifferent < 100 && brownYDifferent > 0 && brownYDifferent < 100) {
          isBrown = true;
        } else {
          isBrown = false;
        }

        redXDifferent = event.position.dx - redX;
        redYDifferent = event.position.dy - redY;

        if (redXDifferent > 0 && redXDifferent < 100 && redYDifferent > 0 && redYDifferent < 100 && !isBrown) {
          isRed = true;
        } else {
          isRed = false;
        }

        greenXDifferent = event.position.dx - greenX;
        greenYDifferent = event.position.dy - greenY;

        if (greenXDifferent > 0 && greenXDifferent < 100 && greenYDifferent > 0 && greenYDifferent < 100 && !isBrown && !isRed) {
          isGreen = true;
        } else {
          isGreen = false;
        }
      },

      /// 彈起監聽
      onPointerUp: (event) {
        print("${event.position.dx}/${event.position.dy}");
      },

      /// 移動監聽
      onPointerMove: (event) {
        if (isBrown) {
          brownX = event.position.dx - brownXDifferent;
          brownY = event.position.dy - brownYDifferent;
          setState(() {});
        }

        if (isRed) {
          redX = event.position.dx - redXDifferent;
          redY = event.position.dy - redYDifferent;
          setState(() {});
        }

        if (isGreen) {
          greenX = event.position.dx - greenXDifferent;
          greenY = event.position.dy - greenYDifferent;
          setState(() {});
        }
      },
      child: Container(
        color: Colors.white,
        height: height,
        width: width,
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(greenX, greenY),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.green,
              ),
            ),

            Transform.translate(
              offset: Offset(redX, redY),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),

            Transform.translate(
              offset: Offset(brownX, brownY),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
