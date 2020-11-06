import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/appBar.dart';

class OtherSetting extends StatefulWidget {
  OtherSetting();

  @override
  State<StatefulWidget> createState() {
    return OtherSettingState();
  }
}

class OtherSettingState extends State<OtherSetting> {
  OtherSettingState();

  String text = "Start";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (ctx) {
        return Column(
          children: [
            appBar(),
            Expanded(
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    asynchronousNaturalsTo(1).listen((event) {
                      text = event;
                      setState(() {});
                    });
                  },
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        );
      },
    ));
  }

  fun(BuildContext ctx) async {
    // 阻塞 直到回傳值
    await Future.delayed(Duration(seconds: 2));
    Scaffold.of(ctx).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text('Success'),
    ));
  }

  Stream<String> asynchronousNaturalsTo(int n) async* {

    yield "Loading";

    await Future.delayed(Duration(seconds: 2));

    if (n == 1) {
      yield "Success";
    } else {
      yield "Failure";
    }

    await Future.delayed(Duration(seconds: 2));

    yield "Start";
  }

  Iterable<int> naturalsTo(int n) sync* {
    print("Begin");
    int k = 0;
    while (k < n) yield k = k + 2;

    print("End");
  }

  Container appBar() {
    return Container(
      height: 80,
      color: Colors.orange,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '返回',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                '其他設定',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
