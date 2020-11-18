import 'package:flutter/material.dart';



class PageOne extends Scaffold {

  
  Function() forgetNum;
  bool visible ;

  PageOne(this.forgetNum,this.visible);
  
  

  @override
  PreferredSizeWidget get appBar {
    return AppBar(
      title: Center(
        child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 300),
          child: Text(
            '擷取紀錄',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
  
  @override
  Widget get body {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            /// 訂位代號 && 身分證或護照後 4 碼
            head(),
            Container(
                height: 390,
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: Color.fromRGBO(210, 210, 210, 1),
                child: column1()),
          ],
        ),
      ),
    );
  }

  Container head() {
    return Container(
      color: Colors.white,
      height: 200,
      padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    '訂位代號',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),

                /// 訂位代號輸入框
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(bottom: 5, top: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '身分證字號或護照後 4 碼',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),

                /// 後 4 碼輸入框
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    margin: EdgeInsets.only(bottom: 5, top: 3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Column column1() {
    return Column(
      children: [
        /// 功能說明
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '功能說明',
            style: TextStyle(fontSize: 22),
          ),
        ),

        /// content
        Flexible(
          fit: FlexFit.tight,
          child: Text(
            '本功能可將高鐵網站、語音訂位紀錄擷取至手機上付款或取票，請輸入您的訂位代號共8碼，及訂位時使用的身分證或護照號碼末 4 碼',
            style: TextStyle(fontSize: 20),
          ),
        ),

        /// 完成 button
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.orange,
          child: FlatButton(
            child: Text(
              '完成',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () {
              // Todo
            },
          ),
        ),

        /// 忘記訂位代號 button
        Container(
          margin: EdgeInsets.only(top: 20),
          height: 50,
          width: double.infinity,
          color: Colors.orange,
          child: FlatButton(
            child: Text(
              '忘記訂位代號',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),

            /// PageView 跳轉方式
            onPressed: () {
              forgetNum();
            },
          ),
        ),
      ],
    );
  }
}
