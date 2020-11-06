import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketDialog extends Center {
  double phoneWidth;
  double phoneHeight;

  BuildContext context;

  TicketDialog(this.phoneWidth, this.phoneHeight, this.context);

  @override
  Widget get child {
    return Container(
      width: phoneWidth * 0.8,
      height: phoneHeight * 0.4,
      child: Column(
        children: [
          /// 上半部內容
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        children: [
                          /// 方塊 ( 包著圓形 )
                          square(),

                          /// 線
                          Container(
                            width: double.infinity,
                            height: 2,
                            color: Colors.orange,
                          )
                        ],
                      ),
                    ),
                  ),

                  /// 內文
                  Expanded(
                    flex: 5,
                    child: content(),
                  )
                ],
              ),
            ),
          ),

          /// 下半部按鈕
          Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// 取消按鈕
                cancelButton(),

                /// 空間
                SizedBox(
                  width: 1,
                ),

                /// 確定按鈕
                comfirmButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Container square() {
    return Container(
      height: 60,
      width: 60,
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.orange),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),

      /// 圓形
      child: circle(),
    );
  }

  Container circle() {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.orange),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(
          '!',
          style: TextStyle(
            fontSize: 26,
            color: Colors.orange,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Container content() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        '是否整理手機內之訂位資料，將過期24小時的訂位紀錄或票券移至歷史紀錄區？',
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Container cancelButton() {
    return Container(
      height: double.infinity,
      width: phoneWidth * 0.4 - 0.5,
      child: FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          '取消',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
        ),
        color: Colors.orange,
      ),
    );
  }

  Container comfirmButton() {
    return Container(
      height: double.infinity,
      width: phoneWidth * 0.4 - 0.5,
      child: FlatButton(
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              duration: Duration(milliseconds: 500),
              content: Container(
                alignment: Alignment.center,
                child: Text('確定送出'),
              ),
            )
          );
        },
        child: Text(
          '確定',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10),
        ),
        color: Colors.orange,
      ),
    );
  }
}
