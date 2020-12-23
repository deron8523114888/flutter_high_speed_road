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
        margin: EdgeInsets.only(top: 50),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildListDelegate(
                [
                  scale(),
                  align(),
                  // item(),
                  // item(),
                  // item(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  scale() {
    bool state = false;

    AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    return Column(
      children: [
        FlatButton(
          child: Text('Scale Click',style: TextStyle(fontSize: 18),),
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
            child: ScaleTransition(
              scale: _controller,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FlutterLogo(size: 150.0),
              ),
            ),
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
          child: Text('Move Click',style: TextStyle(fontSize: 18),),
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
