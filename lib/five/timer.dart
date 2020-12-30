import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer> {
  int count = 60;

  Timer myTimer;

  @override
  void dispose() {
    myTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          FlatButton(
            child: Container(
              width: double.infinity,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue),
              child: Text('開始'),
            ),
            onPressed: () {
              Timer.periodic(Duration(seconds: 1), (timer) {
                myTimer = timer;
                count--;
                print(count);
                if (count <= 0) {
                  count = 60;
                  print(count);
                  timer.cancel();
                }
                setState(() {});
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
