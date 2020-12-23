

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogpage/align_animation_dialog.dart';
import 'dialogpage/swipe_dialog.dart';
import 'dialogpage/show_dialog.dart';

class DialogPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DialogPageState();

}


class DialogPageState extends State<DialogPage>{

  final controller = PageController(
    initialPage: 0,
    // 顯示範圍佔螢幕比例
    viewportFraction: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: controller,
        children: [
          SwipeDialog(),
          ShowDialog(),
          AlignAnimationDialog()
        ],
      ),
    );
  }

}