import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transition extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransitionState();
}

class TransitionState extends State<Transition> with TickerProviderStateMixin {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100, bottom: 100, left: 50, right: 50),
        child: animation(),
      ),
    );
  }

  animation() {
    bool state = false;

    /// 共用 Controller
    AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    /// Animation<double> 適用【縮放】
    Animation<double> animation1 =
        Tween(begin: 0.0, end: 1.0).animate(_controller);

    /// Animation<AlignmentGeometry> 適用【平移】
    Animation<AlignmentGeometry> animation2 =
        Tween(begin: Alignment(0.0, 0.0), end: Alignment(0.0, 2.0))
            .animate(_controller);

    return Column(
      children: [
        FlatButton(
          child: Text(
            'Scale Click',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            if (state) {
              state = false;
              _controller.reverse();
            } else {
              state = true;
              _controller.forward();
            }
          },
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10))),

            /// 整體縮放 ( Animation<double> )
            // child: ScaleTransition(
            //   scale: animation1,
            //   child: const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: FlutterLogo(size: 150.0),
            //   ),
            // ),

            /// X or Y 縮放 ( Animation<double> )
            child: SizeTransition(
              sizeFactor: animation1,
              // child: FlutterLogo(size: 150.0),
              child: Container(
                height: 200,
                width: 100,
                color: Colors.blue,
              ),
              axisAlignment: -6.0,
            ),

            /// 平移
            // child: AlignTransition(
            //   alignment: animation2,
            //   child: FlutterLogo(size: 50.0),
            // ),
          ),
        ),
      ],
    );
  }

  align() {
    bool state = false;
    AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    /// X or Y 軸 ， 從 Widget 一倍的距離回到原位
    Animation<AlignmentGeometry> animation =
        Tween(begin: Alignment(0.0, 1.0), end: Alignment(0.0, 0.0))
            .animate(_controller);

    return Column(
      children: [
        FlatButton(
          child: Text(
            'Move Click',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            if (state) {
              state = false;
              _controller.reverse();
            } else {
              state = true;
              _controller.forward();
            }
          },
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: AlignTransition(
              alignment: animation,
              child: FlutterLogo(size: 50.0),
            ),
          ),
        ),
      ],
    );
  }
}
