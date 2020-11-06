import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomPState();
}

class CustomPState extends State<CustomP> {
  CustomPainter mypainter;

  /// 畫面上所有黑子的座標
  List<Offset> black = [];

  /// 畫面上所有白子的座標
  List<Offset> white = [];

  /// 控制當前落子為【白】or【黑】
  bool isBlack = true;

  bool isFinishGame = false;

  @override
  Widget build(BuildContext context) {
    mypainter = MyPainter(black, white);

    return Scaffold(
        body: Builder(
      builder: (context) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: FlatButton(
              onPressed: () {
                isFinishGame = false;
                isBlack = true;
                black.clear();
                white.clear();
                setState(() {});
              },
              child: Text(
                '重開一局',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),

          /// 棋盤
          Listener(
            child: CustomPaint(
              /// 可畫的範圍，若有 child 則忽略
              size: Size(300, 300),
              painter: mypainter,
            ),

            /// 每次點擊
            onPointerDown: (event) {
              if (!isFinishGame) {
                var offset = localPositionTransform(
                    event.localPosition.dx, event.localPosition.dy) as Offset;
                if (black.contains(offset) || white.contains(offset)) {
                  showSnackBar(context, '該位置有棋子了!');
                  return;
                }

                if (isBlack) {
                  black.add(offset);
                  if (detectIsWin(offset, black)) {
                    finishGame(context, "【Finish】\n\nBlack Win");
                    isFinishGame = true;
                  }
                } else {
                  white.add(offset);
                  if (detectIsWin(offset, white)) {
                    finishGame(context, "【Finish】\n\nWhite Win");
                    isFinishGame = true;
                  }
                }

                setState(() {});
                isBlack = !isBlack;
              } else {
                showSnackBar(context, '遊戲已結束，請重開一局');
              }
            },
          ),
        ],
      )),
    ));
  }

  localPositionTransform(double x, double y) {
    var resultX = (x / 20).round() * 20.toDouble();
    var resultY = (y / 20).round() * 20.toDouble();
    return Offset(resultX, resultY);
  }

  showSnackBar(BuildContext ctx, String msg) async {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text(msg),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  List<Offset> black;
  List<Offset> white;

  MyPainter(this.black, this.white);

  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    /// 棋盤底色【筆】
    var paint = Paint()
      ..color = Color(0x77cdb175)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    /// 畫
    canvas.drawRect(Offset.zero & size, paint);

    /// 棋盤格線【筆】
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    /// 畫橫線
    for (int i = 0; i <= 15; ++i) {
      /// drawLine ( 起點 , 終點 , 畫筆 )
      canvas.drawLine(
          Offset(0, eHeight * i), Offset(size.width, eHeight * i), paint);
    }

    /// 畫直線
    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    /// 畫黑子
    /// drawCircle ( 座標 , 半徑 , 筆 )
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    black?.forEach((element) {
      canvas.drawCircle(
        element,
        9,
        paint,
      );
    });

    /// 畫白子
    paint.color = Colors.white;
    white?.forEach((element) {
      canvas.drawCircle(
        element,
        9,
        paint,
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return true;
  }
}

/// 判斷是否獲勝
bool detectIsWin(Offset offset, List<Offset> list) {
  dynamic num = 0;

  /// 水平連線
  for (int i = 0; i < 9; i++) {
    var pickOffset = Offset(offset.dx - 80 + 20 * i, offset.dy);
    if (list.contains(pickOffset)) {
      num++;
      if (num == 5) {
        return true;
      }
    } else {
      num = 0;
    }
  }

  /// 垂直連線
  for (int i = 0; i < 9; i++) {
    var pickOffset = Offset(offset.dx, offset.dy - 80 + 20 * i);
    if (list.contains(pickOffset)) {
      num++;
      if (num == 5) {
        return true;
      }
    } else {
      num = 0;
    }
  }

  ///【左上到右下】斜線
  for (int i = 0; i < 9; i++) {
    var pickOffset = Offset(offset.dx - 80 + 20 * i, offset.dy - 80 + 20 * i);
    if (list.contains(pickOffset)) {
      num++;
      if (num == 5) {
        return true;
      }
    } else {
      num = 0;
    }
  }

  ///【右上到左下】斜線
  for (int i = 0; i < 9; i++) {
    var pickOffset = Offset(offset.dx - 80 + 20 * i, offset.dy + 80 - 20 * i);
    if (list.contains(pickOffset)) {
      num++;
      if (num == 5) {
        return true;
      }
    } else {
      num = 0;
    }
  }

  return false;
}

finishGame(BuildContext context, String msg) {
  showDialog(
    context: context,
    child: Center(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    ),
  );
}
