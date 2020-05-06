import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class AboutUs extends StatefulWidget{
  final String myData;
  AboutUs({this.myData});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _aboutUs();
  }
}

class _aboutUs extends State<AboutUs>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us", style:  Constant.myStyle,),
//        backgroundColor: ,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 15,
                  ),
//            Text("About Flite",style: TextStyle(fontSize: 22),),
                  Container(
                    height: 15,
                  ),
//
                  Html(
                    defaultTextStyle:  Constant.myStyle,
                    data: """
                    ${widget.myData}
                    """,
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),)
        ),
      )

    );
  }
}