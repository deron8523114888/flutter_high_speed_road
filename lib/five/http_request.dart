import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HttpReq extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => HttpRequestState();

}

class HttpRequestState extends State<HttpReq>{

  String url = "https://www.google.com/?hl=zh_tw";

  String text = "Start";

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: FlatButton(
          onPressed: (){
            text = "Loading";
            setState(() {});
            request();
          },
          child: showData(text),
        ),
      )
    );
  }


  request() async{
    // 阻塞到取得 response
    Response response = await get(url);
    text = response.body;
    setState(() {});
  }




  FutureBuilder futureBuilder (){
    return FutureBuilder(
      future: get(url),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return showData('Error');
          }
          if(snapshot.hasData){
            return showData(snapshot.data.toString());

          }
        }
        return showData("Loading");
      },
    );
  }
  
  Text showData(String msg){
    return Text(
      msg,
      style: TextStyle(
        fontSize: 16,
        color: Colors.blue
      ),
    );
  }
}