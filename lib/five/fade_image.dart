import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadaImageState();
}

class FadaImageState extends State<FadeImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2,color: Colors.black)
                  ),
                  child: FadeInImage.assetNetwork(
                    /// URL
                    image: 'https://i.imgur.com/Zah36j2.jpg',
                    /// 可存放的本地位置
                    placeholder: '',
                    /// 顯示的動畫時間  ( 載入成功後的顯示動畫時間 )
                    fadeInDuration: Duration(seconds: 3),
                    /// 動畫呈現過程的曲線效果 https://api.flutter.dev/flutter/animation/Curves/bounceInOut-constant.html
                    fadeInCurve: Curves.bounceInOut,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black)
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: '',
                    image: 'https://i.imgur.com/wsuSoiJ.png',
                    fadeInDuration: Duration(seconds: 3),
                    fadeInCurve: Curves.bounceIn,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.black)
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: '',
                    image: 'https://i.imgur.com/0CxsUVg.jpg',
                    fadeInDuration: Duration(seconds: 3),
                    fadeInCurve: Curves.bounceOut,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
