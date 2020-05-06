import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class ContactUs extends StatefulWidget{
  final String myData;
  ContactUs({this.myData});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _contactUs();
  }
}

class _contactUs extends State<ContactUs>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact Us",style: Constant.myStyle,),
      ),
      body: SingleChildScrollView(
        child:Container(
            child: Padding(padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 15,
                  ),
                  Html(
                    defaultTextStyle:  Constant.myStyle,
                    data: """
                    ${widget.myData}
                    """,
                    padding: EdgeInsets.all(8.0),
                  ),
                ],
              ),)
        )
      )
    );
  }
}