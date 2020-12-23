import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwipeDialogState();
}

class SwipeDialogState extends State<SwipeDialog>
    with TickerProviderStateMixin {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
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
              '底部彈出 Dialog ',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierLabel: "",
                // 點擊空白處是否關閉
                barrierDismissible: true,
                // 動畫時間
                transitionDuration: const Duration(milliseconds: 200),

                // 設置 Dialog 的動畫、UI
                pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                  // Dialog UI
                  return Container(alignment: Alignment.bottomCenter, child: dialog());
                },

                // Animation.value 預設為 1 -> 0
                transitionBuilder: (ctx, animation, _, child) {

                  return FractionalTranslation(
                    /// Offset( 向右位移螢幕倍數距離 , 向下位移螢幕倍數距離 )
                    /// 設置 0 則代表位移距離為 0 (不位移)
                    translation: Offset(0, 1 - animation.value),
                    child: child,
                  );
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
