import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  PickedFile _imgPath;
  PickedFile _imgPath2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: imageView(),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: imageView2(),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageView() {
    if (_imgPath == null) {
      return FlatButton(
          child: Text("打開相機", style: TextStyle(fontSize: 26)),
          onPressed: _takePhoto);
    }
    return FittedBox(
      /// 補上 FittedBox 讓 child widget 填滿 parent widget
      fit: BoxFit.fill,

      /// 多包一層 CLipRRect 可對圖片做圓角
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),

        /// 將拍照取得的 image 路徑，用 Image.file 呈現
        child: Image.file(File(_imgPath.path)),
      ),
    );
  }

  Widget imageView2() {
    if (_imgPath2 == null) {
      return FlatButton(
        child: Text("打開相簿", style: TextStyle(fontSize: 26)),
        onPressed: _openGallery,
      );
    }
    return FittedBox(
      /// 補上 FittedBox 讓 child widget 填滿 parent widget
      fit: BoxFit.fill,

      /// 多包一層 CLipRRect 可對圖片做圓角
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),

        /// 將拍照取得的 image 路徑，用 Image.file 呈現
        child: Image.file(File(_imgPath2.path)),
      ),
    );
  }

  /// 拍照
  Future<void> _takePhoto() async {
    try {
      PickedFile image =
          await ImagePicker().getImage(source: ImageSource.camera);
      _imgPath = image;

      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  /// 相簿
  Future<void> _openGallery() async {
    try {
      PickedFile image =
          await ImagePicker().getImage(source: ImageSource.gallery);
      _imgPath2 = image;

      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }
}
