import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/twoExpanded.dart';

Container forColumeOne() {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              '起訖車站',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              /// 左營
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    '左營',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              /// 箭頭
              Icon(Icons.arrow_forward, size: 40, color: Colors.grey),

              /// 台北
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    '台北',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
              ),

              /// 最右側箭頭
              Icon(Icons.arrow_forward_ios, size: 26, color: Colors.orange)
            ],
          ),
        )
      ],
    ),
  );
}

Container line() {
  return Container(
    height: 1,
    color: Colors.white,
    child: Container(
      margin: EdgeInsets.only(left: 20),
      color: Colors.grey,
    ),
  );
}

Container forChoose(String title, Alignment selectAlignment,
    flatButton leftButton, flatButton rightButton) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 30),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white),
            child: Stack(
              alignment: selectAlignment,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: Colors.orange),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: leftButton),
                      Expanded(flex: 1, child: rightButton),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Container forColume3And4(
  String title,
  String content,
) {
  return Container(
    height: 80.0,
    padding: EdgeInsets.all(20),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Text(
                  content,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, color: Colors.orange),
              ))
            ],
          ),
        )
      ],
    ),
  );
}

Container forColumeFour() {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              '車廂種類',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [],
          ),
        )
      ],
    ),
  );
}

Container PassengerNum(double h) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.white,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              '乘客人數',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 30),
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      type('全票  1'),
                      type('敬老  1'),

                      /// 【標準車廂】才顯示大學生
                      /// 【商務車廂】不顯示
                      AnimatedContainer(
                        height: h,
                        duration: Duration(milliseconds: 200),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.all(5),
                        child: Text(
                          '大學生  1',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      type('孩童  1'),
                      type('愛心  1'),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Container type(String type) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.all(5),
    child: Text(
      type,
      style: TextStyle(fontSize: 20),
    ),
  );
}
