import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text.dart';

class One extends StatelessWidget {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final phoneWidth = size.width;
    final phoneHeight = size.height;


    /// 所有元件高度 634
    dynamic height = 634.0;

    /// fragment 顯示畫面 是否大於 元件總高度
    /// 若大於 則 以螢幕高度顯示
    /// 若小於 則 以元件高度為準
    if(phoneHeight - 80 > 634){
      height = phoneHeight- 80;
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          color: Color.fromRGBO(209, 209, 209, 1),
          child: Column(
            key: _scaffoldKey,
            mainAxisSize: MainAxisSize.max,
            children: [
              /// 上方橘色部分
              Container(
                width: phoneWidth,
                padding: EdgeInsets.only(bottom: 20, top: 20),
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppBarChiText('台灣高鐵'),
                    AppBarEngText('TAIWAN HIGH SPEEED RAIL')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: phoneWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.text_fields, size: 100),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '您目前沒有可使用的車票\n立即',
                          style: TextStyle(
                              fontSize: 24,
                              color: Color.fromRGBO(110, 110, 110, 1),
                              fontWeight: FontWeight.bold),

                          /// childrean 裡面沒設置的，會 follow RichText 的屬性
                          children: <TextSpan>[
                            TextSpan(
                                text: ' 訂票 ',
                                style: TextStyle(
                                    fontSize: 26, color: Colors.orange)),
                            TextSpan(text: '或'),
                            TextSpan(
                                text: ' 取票 ',
                                style: TextStyle(
                                    fontSize: 26, color: Colors.orange)),
                            TextSpan(
                              text: '\n\n\n\n版本：5.21\n\n\n\n',
                            ),
                          ]),
                    ),
                    Icon(Icons.feedback),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
