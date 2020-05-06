import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class ShareApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShareApp();
  }
}

class _ShareApp extends State{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Share App"
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 20,
            ),

            Text("Share the Application",style: TextStyle(fontSize: 20),),

            Container(
              height: 25,
            ),

            Container(
              width: 150,
              child: MaterialButton(
                minWidth: 100,
                color: Colors.lightBlueAccent,
                onPressed: (){
                  Share.share('check out my website https://example.com');
                },
                child: Center(
                    child:
                    Text(
                        "Share Applicaion",
                       style: Constant.myStyle
                    )
                ),
              ),
            ),
            Container(
              height: 15,
            ),
            Text("Share the application on social media. \n You will get instant your "
                "application link after clicking the button. \n After that you will "
                "display a screen link all your avaliable apps or you can also copy"
                " link." ,style: Constant.myStyle),
            Container(
              height: 15,
            ),

          ],
        ),
      ),
    );
  }
}