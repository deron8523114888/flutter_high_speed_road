import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class flatButton extends FlatButton {

  final String text;
  final Color color_;
  Function() click ;

  flatButton(this.text, this.color_,this.click);

  @override
  get onPressed {
    return click;
  }

  @override
  Widget get child {
    return Text(
      text,
      style: TextStyle(fontSize: 22,color: color_),
    );
  }


}
