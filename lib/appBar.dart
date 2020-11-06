import 'package:flutter/material.dart';

AppBar twoAppBar() {
  return AppBar(
    title: Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              child: Text(
                '信用卡優惠',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              alignment: Alignment.centerLeft,
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Text(
                '訂票',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              alignment: Alignment.center,
            )),
        Expanded(
            flex: 1,
            child: Container(
              child: Text(
                '查詢',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              alignment: Alignment.centerRight,
            ))
      ],
    ),
  );
}