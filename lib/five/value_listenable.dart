import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// ValueListenable 相當於 dataBinding
/// FractionallySizedBox 依照比例設計寬高 (就不需要用 phoneSize 計算)
/// Container 裡的 Decoration 裡的 Shape 使用
/// Selectable Text  ( 可反白、複製的 Text )

class ManyOption extends StatefulWidget {
  ValueNotifier name;

  ManyOption(this.name);

  @override
  State<StatefulWidget> createState() => ManyOptionState(name);
}

class ManyOptionState extends State<ManyOption>
    with TickerProviderStateMixin {
  ValueNotifier name;

  ManyOptionState(this.name);

  AnimationController controller;
  Animation<double> animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..repeat();
    animation = Tween(begin: 1.0, end: 0.0).animate(controller);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () {},
              child: Text(
                name.value,
                style: TextStyle(fontSize: 30),
              ),
            ),
            ValueListenableBuilder(
              builder: (context, value, child) {
                return Text(
                  value,
                  style: TextStyle(fontSize: 26),
                );
              },
              valueListenable: name,
              child: Text(
                'test',
                style: TextStyle(fontSize: 26),
              ),
            ),
            FadeTransition(
              opacity: animation,
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: Container(
                    height: 150,
                    color: Colors.black,
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: Container(
                        height: 150,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: Text(
                          'Hello World',
                          style: TextStyle(fontSize: 22, color: Colors.yellow),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ),
            ),
            Container(
              height: 150,
              width: 200,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.purple),
//              constraints: BoxConstraints.tightForFinite(
//                width: 200
//              ),
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/222.png'),
            ),
            Container(
              width: 100,
              height: 100,
              child: ClipOval(
                  child: Image.asset('assets/222.png'),
              ),
            ),
            
            /// 按著會出現【複製】等等文字提示
            SelectableText(
              'Selectable Text',
              style: TextStyle(fontSize: 22),
              showCursor: true,
              toolbarOptions: ToolbarOptions(
                copy: true,
                cut: true,
                paste: true,
                selectAll: true,
              ),
              onTap: (){
                print('kk');
              },
            ),
            SelectableText.rich(
              TextSpan(children: [
                TextSpan(text: 'red',style: TextStyle(color: Colors.red,fontSize: 22)),
                TextSpan(text: 'green',style: TextStyle(color: Colors.green,fontSize: 22)),
                TextSpan(text: 'black',style: TextStyle(color: Colors.black,fontSize: 22)),
              ]),

            )
          ],
        ),
      ),
    );
  }
}
