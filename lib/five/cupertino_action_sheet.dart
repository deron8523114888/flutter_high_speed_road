import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CupertinoState();
}

class CupertinoState extends State<Cupertino> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: FlatButton(
            child: Text(
              'Click',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: Text('This is title'),
                  message: Text('This is message'),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        print('one');
                      },
                      child: Text('Click One'),
                      isDefaultAction: true,
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () {
                        print('two');
                      },
                      child: Text('Click Two'),
                      isDestructiveAction: true,
                    ),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            },
          ),
        ));
  }
}
