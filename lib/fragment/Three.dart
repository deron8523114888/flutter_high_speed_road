import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text.dart';

class Three extends StatelessWidget {
  BuildContext context;

  Three(this.context);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final phoneWidth = size.width;
    final phoneHeight = size.height;


    /// 所有元件高度 614
    dynamic height = 565.0;

    /// fragment 顯示畫面 是否大於 元件總高度
    /// 若大於 則 以螢幕高度顯示
    /// 若小於 則 以元件高度為準
    if(phoneHeight - 80 > 565){
      height = phoneHeight- 80;
    }


    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(235, 235, 235, 1),
          height: height,
          child: Column(
            children: [
              /// 上方綠色部分
              logo(),

              /// body 部分
              Container(
                color: Color.fromRGBO(235, 235, 235, 1),
                padding: EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    children: [
                      /// 現在發船時間
                      ContainerOne(),

                      /// 時間部分
                      ContainerTwo(context),

                      /// 確認並開始驗票作業的 Button
                      DetectButton(context),
                    ],
                  ),
                ),
              ),

            ],
          ),
        )
      ),
    );
  }
}

Container logo() {
  return Container(
    padding: EdgeInsets.only(bottom: 20, top: 20),
    color: Color.fromRGBO(105, 206, 162, 1),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: Image.asset(
            'assets/logo.png',
            color: Colors.white,
            width: 300,
            height: 150,
          ),
        ),
      ],
    ),
  );
}

class ContainerOne extends Container {
  @override
  AlignmentGeometry get alignment {
    return Alignment.centerLeft;
  }

  @override
  EdgeInsetsGeometry get margin {
    return EdgeInsets.only(bottom: 20);
  }

  @override
  Widget get child {
    return Text(
      '現在發船時間',
      style: TextStyle(fontSize: 22, color: Color.fromRGBO(112, 112, 112, 1)),
    );
  }
}

class ContainerTwo extends Container {
  BuildContext context;

  ContainerTwo(this.context);

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.only(top: 20, bottom: 20);

  @override
  Decoration get decoration {
    return BoxDecoration(
        border: Border.all(color: Color.fromRGBO(225, 225, 225, 1), width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white);
  }

  @override
  Widget get child {
    return FlatButton(
      onPressed: () {
        /// Todo 按下需要跳出 Picker 選取時間
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('修改時間')
              ],
            ),
          ),
        );
      },
      child: Center(
        child: Text(
          '12  ：13',
          style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(112, 112, 112, 1)),
        ),
      ),
    );
  }
}

class DetectButton extends Container {
  BuildContext context;

  DetectButton(this.context);

  @override
  AlignmentGeometry get alignment => Alignment.center;

  @override
  EdgeInsetsGeometry get margin => EdgeInsets.only(top: 50);

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.only(top: 10, bottom: 10);

  @override
  Color get color => Color.fromRGBO(105, 206, 162, 1);

  @override
  Widget get child {
    return FlatButton(
      onPressed: () {
        /// Todo 確認送出
        Scaffold.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text('確認送出')
              ],
            ),
          ),
        );
      },
      child: Text(
        '確認並開始驗票作業',
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
