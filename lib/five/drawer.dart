import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  Size phoneSize;

  bool bo1 = false;
  bool bo2 = false;

  @override
  Widget build(BuildContext context) {
    phoneSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// IOS Switch Button
                  CupertinoSwitch(
                    /// 當前顯示狀態
                    value: bo1,

                    /// 按下後的 function
                    onChanged: (bool value) {
                      setState(() {
                        bo1 = !bo1;
                        if (bo1 && bo2) {
                          Scaffold.of(context).openDrawer();
                        }
                      });
                    },

                    /// 【開】背景底色
                    activeColor: Colors.blue,

                    /// 【關】背景底色
                    trackColor: Colors.yellow,
                  ),

                  Container(
                    height: 50,
                    child: VerticalDivider(
                      // 粗度
                      thickness: 3,
                      color: Colors.blue,
                      // 左 margin
                      indent: 0,
                      // 右 margin
                      endIndent: 0,
                    ),
                  ),

                  /// IOS Switch Button
                  CupertinoSwitch(
                    /// 當前顯示狀態
                    value: bo2,

                    /// 按下後的 function
                    onChanged: (bool value) {
                      setState(() {
                        bo2 = !bo2;
                        if (bo1 && bo2) {
                          Scaffold.of(context).openDrawer();
                        }
                      });
                    },

                    /// 【開】背景底色
                    activeColor: Colors.blue,

                    /// 【關】背景底色
                    trackColor: Colors.yellow,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Row(
                  children: [
                    /// 左側內容
                    Expanded(
                      child: Container(
//                      alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text('這是中文', style: TextStyle(fontSize: 25)),
                            Text('Chinese', style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                    ),

                    /// 中間 icon
                    Icon(Icons.delete),

                    /// 右側內容
                    Expanded(
                      child: Container(
//                      alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Text('這是中文', style: TextStyle(fontSize: 25)),
                            Text('Chinese', style: TextStyle(fontSize: 20))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: myDrawer());
  }

  myDrawer() {
    return Container(
      color: Colors.white,
      width: phoneSize.width / 2,
      child: Column(
        children: [
          Container(
            height: 120,
            color: Color(0xFF84DBD1),
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              '區塊編排',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              /// listView 自帶 padding 需要蓋掉
              padding: EdgeInsets.zero,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(child: list[index].leading),
                          Expanded(
                            flex: 2,
                            child: Text(
                              list[index].title,
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xB2000000)),
                            ),
                          ),
                          Expanded(child: list[index].trailing),
                        ],
                      ),
                    ),

                    /// ListTile 不夠自由
//                      ListTile(
                    /// ListTile 自帶 padding 需要蓋掉
//                        contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 3, right: 3),
//                        leading: list[index].leading,
//                        title: Text(list[index].title,style: TextStyle(fontSize: 18,color: Color(0xB2000000)),),
//                        trailing: list[index].trailing,
//                      ),

                    Divider(
                      height: 2,
                      color: Colors.black,
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<DrawerItem> list = [
    DrawerItem("倒數計時器"),
    DrawerItem("Logo"),
    DrawerItem("背景圖文"),
    DrawerItem("商品資訊"),
    DrawerItem("1"),
    DrawerItem("2"),
    DrawerItem("3"),
    DrawerItem("4"),
    DrawerItem("5"),
    DrawerItem("6"),
    DrawerItem("7"),
    DrawerItem("8"),
    DrawerItem("9"),
    DrawerItem("10"),
  ];
}

class DrawerItem {
  Icon leading = Icon(Icons.list);
  String title;
  Icon trailing = Icon(Icons.delete);

  DrawerItem(this.title);
}
