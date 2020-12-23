import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dismiss extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DismissState();
}

class DismissState extends State<Dismiss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Dismissible(
              /// 內容
              child: Container(
                color: Colors.orange,
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Text One',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),

              /// 往右滑動，顯示左側的 Widget
              background: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                color: Colors.green,
                child: Icon(
                  CupertinoIcons.check_mark,
                  size: 40,
                ),
              ),

              /// 往左滑動，顯示右側的 Widget
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                height: 40,
                color: Colors.red,
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  size: 40,
                ),
              ),
              key: ValueKey('dkk'),

              /// 左右滑動 or 上下滑動
              direction: DismissDirection.horizontal,
            ),
          ],
        ),
      ),
    );
  }
}
