import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTwo extends Scaffold {

  Function() back;
  bool visible ;

  PageTwo(this.back,this.visible);


  @override
  Color get backgroundColor => Color.fromRGBO(218, 218, 218, 1);


  @override
  Widget get body {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            /// 頂部
            Container(
              color: Colors.orange,
              alignment: Alignment.bottomLeft,
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// 返回
                  backBtn(),

                  /// 查詢訂位代號
                  textTitle(),

                  /// 完成
                  finish()
                ],
              ),
            ),

            /// 內文
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  // 起訖車站
                  startStation(),
                  line(),

                  // 發車日期
                  startDate(),
                  line(),

                  // 車次號碼
                  carNumber(),
                  line(),

                  // 提示文字
                  info(),

                  Column(
                    children: [nation('本國籍'), nation('外國籍')],
                  )
                ],
              ),
            ),

            /// 底部
            bottom(),
          ],
        ),
      ),
    );
  }

  AnimatedOpacity backBtn() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back, size: 26),
            Text(
              '返回',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        onPressed: () {
//          back();
        },
      ),
    );
  }

  AnimatedOpacity textTitle() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        child: Text(
          '查詢訂位代號',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  AnimatedOpacity finish() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: visible ? 1.0 : 0.0,
      child: FlatButton(
        child: Text(
          '完成',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {

        },
      ),
    );
  }

}



/// 起訖車站
Container startStation() {
  return Container(
    height: 30,
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Row(
      children: [
        Text(
          '起訖車站',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 40),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '左營',
                style: TextStyle(fontSize: 20),
              ),
              Icon(
                Icons.arrow_forward,
                size: 30,
              ),
              Text(
                '台北',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(width: 30),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.orange,
        )
      ],
    ),
  );
}

/// 發車日期
Container startDate() {
  return Container(
    height: 30,
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Row(
      children: [
        Text(
          '發車日期',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
            child: Container(
          child: Text(
            '2020/10/29',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
        )),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.orange,
        )
      ],
    ),
  );
}

/// 車次號碼
Container carNumber() {
  return Container(
    height: 50,
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      children: [
        Text(
          '車次號碼',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 40,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            decoration: BoxDecoration(
              border: Border.all(width: 0.3, color: Colors.grey),
            ),
            child: TextFormField(),
          ),
        ),
      ],
    ),
  );
}

/// 橘字部分
Container info() {
  return Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    alignment: Alignment.centerLeft,
    child: Text(
      '訂位取票人資料(擇一填寫)',
      style: TextStyle(fontSize: 16, color: Colors.orange),
    ),
  );
}

Container line() {
  return Container(
    height: 1,
    color: Colors.white,
    child: Container(
      color: Colors.grey,
    ),
  );
}

/// 本國籍 外國籍
Row nation(String title) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          height: 50,
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
        ),
      )
    ],
  );
}

Container bottom() {
  return Container(
    height: 250,
    width: double.infinity,
    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '功能說明：',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ),
        Text(
          '1. 無法提供查詢已逾發車日期之訂位紀錄。\n2.本功能是用網路訂位系統及自動語音訂票系統預訂之訂位代號查詢(已完成取票之訂位紀錄，或網路訂位「信用卡合作優惠專區」未付款之訂位紀錄不適用)',
          style: TextStyle(fontSize: 18, color: Colors.black),
        )
      ],
    ),
  );
}
