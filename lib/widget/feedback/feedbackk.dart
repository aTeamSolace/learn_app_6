import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class FeedbackPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _FeedbackPage();
  }
}

class _FeedbackPage extends State<FeedbackPage>{

  TextEditingController feedbackText = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Feedback",style: Constant.myStyle,),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
            child: Center(
              child: Text("Any query or want to give any suggestion?",
                style:  Constant.myStyle,),
            ),),
            Center(
              child: Text("Please leave any commnet in below",style: Constant.myStyle,),
            ),
            Container(
              height: 5,
            ),
            Center(
              child: Text("Thank you !",style: Constant.myStyle,),
            ),
            Container(
              height: 15,
            ),
           Container(
             height: MediaQuery.of(context).size.height / 2,
             width: MediaQuery.of(context).size.width / 1.2,
             decoration: BoxDecoration(
               gradient: LinearGradient(colors: [Colors.purple, Colors.red],
               begin: Alignment.topLeft,
               end: Alignment.bottomRight)
             ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[

                 Container(
                   height: 30,
                 ),
                 Icon((Icons.feedback),color: Colors.white,size: 100,),
                 Container(
                   width: MediaQuery.of(context).size.width / 1.5,
                   height: 50,
                   child: TextFormField(
                     controller: feedbackText,
                     decoration: InputDecoration(
                       hintText: "Feedback",
                       focusedBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.greenAccent, width: 0.0),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white, width:
                         0.0),
                       ),
                     ),
                   ),
                 ),
                 
                 Padding(padding: EdgeInsets.fromLTRB(0, 0, 30, 20),
                 child: Align(
                   alignment: Alignment.bottomRight,
                   child: MaterialButton(onPressed: (){},
                     color: Colors.blue,
                     child: Text("Submit",style: Constant.myStyle,),),
                 ),),
                 Container(
                   height: 30,
                 )

               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}