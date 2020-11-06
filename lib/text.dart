import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarChiText extends Text {
  AppBarChiText(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              data,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
          Icon(
            Icons.outlined_flag,
            size: 100,
          )
        ],
      ),
    );
  }
}

class AppBarEngText extends Text {
  AppBarEngText(String data) : super(data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
          fontSize: 14, color: Colors.white, fontStyle: FontStyle.italic),
    );
  }
}
