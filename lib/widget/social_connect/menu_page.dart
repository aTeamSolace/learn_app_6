import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class MenuPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuPage();
  }
}
class _MenuPage extends State{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
      Container(
        height: 200,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: (){

                },
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/facebook.png"),
                    Container(width: 10,),
                    Text("Connect With Facebook",style: Constant.myStyle),
                  ],
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/facebook.png"),
                    Container(width: 10,),
                    Text("Connect With Facebook",style: Constant.myStyle),
                  ],
                ),
              ),
              InkWell(
                onTap: (){

                },
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/facebook.png"),
                    Container(width: 10,),
                    Text("Connect With Facebook",style: Constant.myStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  
}