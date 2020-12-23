import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highspeedroad/appBar.dart';
import 'package:highspeedroad/twoContainer.dart';
import 'package:highspeedroad/twoExpanded.dart';

class Two extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TwoState();
  }
}

class TwoState extends State<Two> {
  dynamic GoBackAlignment = Alignment.centerLeft;
  dynamic singleTicketColor = Colors.white;

  dynamic returnTicketColor = Colors.grey;

  dynamic carAlignment = Alignment.centerLeft;
  dynamic standardTicketColor = Colors.white;

  dynamic businessTicketColor = Colors.grey;

  dynamic seatAlignment = Alignment.centerLeft;
  dynamic noneColor = Colors.white;

  dynamic selectColor = Colors.grey;

  dynamic textColor = Colors.black;

  dynamic num = 1.0;

  dynamic animationHeight = 0.0;

  dynamic h = 30.0;

  bool isGoBack = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
        appBar: twoAppBar(),
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(210, 210, 210, 1),
            child: Column(
              children: [
                /// 起訖車站
                forColumeOne(),
                line(),

                /// 去/回程
                forChoose(
                    '去/回程',
                    GoBackAlignment,
                    flatButton('單程票', singleTicketColor, singleTicketClick),
                    flatButton('去回票', returnTicketColor, returnTicketClick)),
                line(),

                /// 去程時間
                forColume3And4('去程時間', '2020/10/22 11:36'),
                line(),

                /// 回程時間  => 若選擇【去回票】時才顯示

                AnimatedCrossFade(
                  /// 設定 child one
                  firstChild: Container(),
                  /// 設定 child two
                  secondChild: Column(
                    children: [
                      forColume3And4('回程時間', '請選擇回程日期'),
                      line(),
                    ],
                  ),
                  /// 判斷 show 哪一個 child
                  crossFadeState: isGoBack
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  /// 動畫時間
                  duration: Duration(milliseconds: 500),
                ),

                /// 車廂種類
                forChoose(
                    '車廂種類',
                    carAlignment,
                    flatButton('標準', standardTicketColor, standardClick),
                    flatButton('商務', businessTicketColor, businessClick)),
                line(),

                /// 座位喜好
                forChoose(
                    '座位喜好',
                    seatAlignment,
                    flatButton('無', noneColor, noneClick),
                    flatButton('請選擇', selectColor, selectClick)),
                line(),

                /// 乘客人數
                PassengerNum(h),
              ],
            ),
          ),
        ));
  }

  /// 【單程票】按鈕
  singleTicketClick() {
    GoBackAlignment = Alignment.centerLeft;
    singleTicketColor = Colors.white;
    returnTicketColor = Colors.grey;
    textColor = Colors.black;
    animationHeight = 0.0;
    isGoBack = false;
    setState(() {});
  }

  /// 【去回票】按鈕
  returnTicketClick() {
    GoBackAlignment = Alignment.centerRight;
    singleTicketColor = Colors.grey;
    returnTicketColor = Colors.white;
    textColor = Colors.orange;
    animationHeight = 81.0;
    isGoBack = true;
    setState(() {});
  }

  /// 【標準】按鈕
  standardClick() {
    carAlignment = Alignment.centerLeft;
    standardTicketColor = Colors.white;
    businessTicketColor = Colors.grey;
    h = 30.0;
    setState(() {});
  }

  /// 【商務】按鈕
  businessClick() {
    carAlignment = Alignment.centerRight;
    standardTicketColor = Colors.grey;
    businessTicketColor = Colors.white;
    h = 0.0;
    setState(() {});
  }

  /// 【無】按鈕
  noneClick() {
    seatAlignment = Alignment.centerLeft;
    noneColor = Colors.white;
    selectColor = Colors.grey;
    setState(() {});
  }

  /// 【請選擇】按鈕
  selectClick() {
    seatAlignment = Alignment.centerRight;
    noneColor = Colors.grey;
    selectColor = Colors.white;
    setState(() {});
  }
}
