import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class SocialConnect extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SocialConnect();
  }
}
class _SocialConnect extends State<SocialConnect>{


  _launchURL(var myUrl) async {
    const url = 'https://flutter.dev';
    if (await canLaunch(myUrl)) {
      await launch(myUrl);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
    body: Container(
      height: deviceHeight,
      width: deviceWidth,
      child: Column(
        children: <Widget>[

          Container(
            width: deviceWidth / 1.5,
            height: deviceHeight / 3.5,
            child: Image.asset("assets/social.png"),
          ),
          Container(
            height: 10,
          ),
          Text("Socially Connect With Us",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Container(
            height: 20,
          ),
          Divider(
            color: Colors.blue,
          ),
          InkWell(
            onTap: (){
              _launchURL("https://www.facebook.com/");
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                ),

                Image.asset("assets/facebook.png",height: 50,width: 50,),
                Container(width: 20,),
                Text("Connect With Facebook",style: Constant.myStyle),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Divider(
            color: Colors.purpleAccent,
          ),
          InkWell(
            onTap: (){
              _launchURL("https://www.instagram.com/");
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                ),
                Image.asset("assets/insta.png",height: 50,width: 50,),
                Container(width: 20,),
                Text("Connect With Instagram",style: Constant.myStyle),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Divider(
            color: Colors.red,
          ),
          InkWell(
            onTap: (){
              _launchURL("https://www.youtube.com/");
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 10,
                ),
                Image.asset("assets/youtube.png",height: 50,width: 50,),
                Container(width: 20,),
                Text("Connect With Youtube",style: Constant.myStyle),
              ],
            ),
          ),
          Container(
            height: 10,
          ),
          Divider(
            color: Colors.blue,
          ),
        ],
      ),
    )
    );
  }
}