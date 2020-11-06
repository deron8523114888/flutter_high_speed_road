import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/Main/Forget.dart';

import '../Animation.dart';

class Four extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FourState();
  }
}

class FourState extends State<Four> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(210, 210, 210, 1),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            '擷取紀錄',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                child: Column(
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
                          toast(context, '完成');
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
                        onPressed: () {
                          Navigator.push(
                            _scaffoldKey.currentState.context,

                            /// 動畫跳轉
                            SlideLeftAnimation(builder: (context) => Forget()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

Container textTitle() {
  return Container(
    margin: EdgeInsets.only(bottom: 4),
    child: Text(
      '查詢訂位代號',
      style: TextStyle(fontSize: 24, color: Colors.white),
    ),
  );
}

FlatButton finish(BuildContext context) {
  return FlatButton(
    child: Text(
      '完成',
      style: TextStyle(fontSize: 20),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
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
          flex: 1,
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
          flex: 1,
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

toast(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
  );
}
