import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShowDialogState();
}

class ShowDialogState extends State<ShowDialog> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        height: 100,
        margin: EdgeInsets.only(top: 100, left: 20, right: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black, width: 2)),
        child: Container(
          height: 100,
          width: double.infinity,
          child: FlatButton(
            child: Text(
              '直接 Show Dialog ',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) {
                  /// 最外層全螢幕
                  return Container(
                      alignment: Alignment.bottomCenter, child: dialog());
                },
              );
            },
          ),
        ),
      ),
    );
  }

  dialog() {
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '上架設定',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Icon(CupertinoIcons.multiply_circle),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            height: 3,
          ),
          Container(
            child: Text('kdoewko'),
          )
        ],
      ),
    );
  }
}
