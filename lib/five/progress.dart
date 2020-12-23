import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProgressState();
}

class ProgressState extends State<Progress> {
  bool isCircleShow = false;
  bool isLineShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// 控制 CircularProgress
                FlatButton(
                    onPressed: () {
                      isCircleShow = !isCircleShow;
                      setState(() {});
                    },
                    child: Text(
                      'progress1',
                      style: TextStyle(fontSize: 20),
                    )),

                /// 控制 LinearProgress
                FlatButton(
                    onPressed: () {
                      isLineShow = !isLineShow;
                      setState(() {});
                    },
                    child: Text(
                      'progress2',
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),

            SizedBox(height: 50),

            /// 載入中 UI
            isCircleShow
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            )
                : Container(),

            SizedBox(height: 50),

            isLineShow
                ? LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            )
                : Container(),
            SizedBox(height: 50),

            CupertinoActivityIndicator(
              radius: 30,
              animating: true,
            ),

            SizedBox(height: 50),

            Divider(
              // 粗度
              thickness: 10,
              color: Colors.purple,
              // 左 margin
              indent: 20,
              // 右 margin
              endIndent: 20,

            ),
            SizedBox(),

            /// 若 progress 執行時，底下元件不可點擊
            AbsorbPointer(
//              ignoringSemantics: isCircleShow || isLineShow,
              absorbing: isCircleShow || isLineShow,
//            ignoring: isCircleShow || isLineShow,
              child: Table(
                children: [
                  TableRow(children: [
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {
                        print('kkk');
                      },
                    ),
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {},
                    ),
                  ]),
                  TableRow(children: [
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {},
                    ),
                    FlatButton(
                      child: Text('111'),
                      onPressed: () {},
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
