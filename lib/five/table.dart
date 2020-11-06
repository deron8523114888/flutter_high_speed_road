import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TableState();
}

class TableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: table1(),
      )
    );
  }

  /// Table 直接放 children 視為 Column
  Table table1() {
    return Table(
      children: [
        TableRow(
            children: [
              showText('1-1'),
              showText('1-2'),
              showText('1-3'),
            ]
        ),
        TableRow(
            children: [
              showText('2-1'),
              showText('2-2'),
              showText('2-3'),
            ]
        ),

      ],
    );
  }


  Container showText(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 22
        ),
      ),
    );
  }
}