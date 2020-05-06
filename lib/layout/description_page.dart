import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class DescriptionClass extends StatefulWidget{

  final String imageUrl;
  final String courseName;
  final String courseDescription;
  DescriptionClass({
    this.imageUrl,
    this.courseName,
    this.courseDescription});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DescriptionClass();
  }
}
class _DescriptionClass extends State<DescriptionClass>{
  @override
  Widget build(BuildContext context) {
     // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title:  Html(
          defaultTextStyle: Constant.myStyle,
          data: """                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                    ${widget.courseName}
                    """,
          padding: EdgeInsets.all(8.0),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: 20,
                ),
                Container(
                  height: 20,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.network(widget.imageUrl,fit: BoxFit.fill,),
                ),
                Container(
                  height: 20,
                ),
                Padding(padding: EdgeInsets.only(
                    left: 10, right: 10
                ),
                  child:
                  Center(child:
                  Html(
                    defaultTextStyle: Constant.myStyle,
                    data: """                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                    ${widget.courseDescription}
                    """,
                    padding: EdgeInsets.all(8.0),
                  )
                  ),),
                Container(
                  height: 20,
                ),

                MaterialButton(onPressed: (){},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  child: Text("Download Course"),
                  color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        ),                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
      )
     )
    );
  }
}