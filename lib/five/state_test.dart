import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateTest extends StatefulWidget {
  int stateNum;
  ValueNotifier<int> valueStateNum;
  Function() refresh;

  StateTest(this.stateNum, this.valueStateNum, this.refresh);

  @override
  State<StatefulWidget> createState() =>
      StateTestState(stateNum, valueStateNum, refresh);
}

class StateTestState extends State<StateTest> {
  int stateNum;
  ValueNotifier<int> valueStateNum;

  Function() refresh;

  StateTestState(this.stateNum, this.valueStateNum, this.refresh);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'int 變數：$stateNum',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          Text(
            'ValueNotifier 變數：${valueStateNum.value}',
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
          FlatButton(
            child: Text(
              'Refresh Button',
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            onPressed: () {
              stateNum = 5;
              valueStateNum.value = 5;
              refresh;
            },
          )
        ],
      ),
    );
  }
}
