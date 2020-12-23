import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageColor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ImageColorState();
}

class ImageColorState extends State<ImageColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              delegate: SliverChildListDelegate([
                /// Icon 無上色
                iconNoColor(),
                /// Icon 直接上色
                iconSetColor(),

                /// Image 無上色
                imageNoColor(),
                /// Image 直接上色
                imageSetColor(),

                /// 下面都是利用 FilteredColor 上色
                /// modulate
                modulate(),
                /// colorBurn
                colorBurn(),
                /// darken
                darken(),
                /// difference
                difference(),
                /// saturation
                saturation(),


                filteredAnimation()

              ]),
            )
          ],
        ),
      ),
    );
  }

  Container iconNoColor() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Icon(
        Icons.animation,
        size: 100,
      ),
    );
  }

  Container iconSetColor() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Icon(
        Icons.animation,
        size: 100,
        color: Colors.red,
      ),
    );
  }

  Container imageNoColor() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Image.asset('assets/222.png',),
    );
  }

  Container imageSetColor() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Image.asset('assets/222.png',color: Colors.red,),
    );
  }


  Container modulate() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.red, BlendMode.modulate),
        child: Image.asset('assets/222.png'),
      ),
    );
  }

  Container colorBurn() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
        child: Image.asset('assets/222.png'),
      ),
    );
  }

  Container darken() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.red, BlendMode.darken),
        child: Image.asset('assets/222.png'),
      ),
    );
  }

  Container difference() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.red, BlendMode.difference),
        child: Image.asset('assets/222.png'),
      ),
    );
  }

  Container saturation() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.red, BlendMode.saturation),
        child: Image.asset('assets/222.png'),
      ),
    );
  }

  Container filteredAnimation() {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TweenAnimationBuilder<Color>(
        duration: Duration(seconds: 3),
        curve: Curves.linear,
        tween: ColorTween(begin: Colors.white,end: Colors.orange),
        builder: (context,Color value,Widget child){
          return ColorFiltered(
            colorFilter: ColorFilter.mode(value, BlendMode.saturation),
            child: Image.asset('assets/222.png'),
          );
        },

      ),
    );
  }

}
