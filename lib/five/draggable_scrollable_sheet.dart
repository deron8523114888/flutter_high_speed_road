import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DraggableScroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DraggableScrollState();
}

class DraggableScrollState extends State<DraggableScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollableSheet(
        initialChildSize: 0.1,
        minChildSize: 0.1,
        maxChildSize: 0.5,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: double.infinity,
                    child: Text(
                      '--------------',
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.purpleAccent,
                    )),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'AAAAAAAAAAAAAAA',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.red,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'BBBBBBBBBBBBB',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.orange,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'CCCCCCCCCCCC',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'DDDDDDDDDDDDDD',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'EEEEEEEEEEEEE',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Text(
                    'FFFFFFFFFFFFF',
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.purple,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
