import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GalleryState();
}

class GalleryState extends State<Gallery> {
  var _imgPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  FlatButton(
                    child: Text(
                      '打開相機',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Todo 打開相機
                      _takePhoto();
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: imageView(_imgPath),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  FlatButton(
                    child: Text(
                      '打開相簿',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      // Todo 打開相機
                      _openGallery();
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: imageView(_imgPath),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageView(imgPath) {
    if (imgPath == null) {
      return Center(
        child: Text(
          "請打開相簿或拍照",
          style: TextStyle(fontSize: 18),
        ),
      );
    }

    return Image.file(
      imgPath,
    );
  }

  /// 拍照
  Future<void> _takePhoto() async {
    try {
      var image = await ImagePicker().getImage(source: ImageSource.camera);

      setState(() {
        _imgPath = image;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  /// 相簿
  Future<void> _openGallery() async {
    try {
      var image = await ImagePicker().getImage(source: ImageSource.gallery);

      setState(() {
        _imgPath = image;
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
