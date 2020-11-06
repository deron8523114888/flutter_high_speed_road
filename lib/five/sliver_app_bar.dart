import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomAppbarState();
}

class CustomAppbarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 100.0,
          floating: true,
          title: Text('SliverAppBar'),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 200,
                color: Colors.red,
              )
            ],
          ),
        ),
        SliverGrid(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.blueGrey,
              )
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 200,
                  color: Colors.deepOrangeAccent,
                )
              ],
            )
        ),
        SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 200,
                  color: Colors.orange,
                )
              ],
            )
        )
      ],
    );
  }
}
