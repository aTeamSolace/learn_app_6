import 'dart:async';
import 'dart:convert';
import 'package:learn_app_6/layout/botton_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomNavPage(initialIndex: 0,)));
  }

  @override
  void initState() {
    setState(() {
      drawerData();
    });
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation = new CurvedAnimation(
        parent: animationController, curve: Curves.bounceOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  var myDrawerPages = [];

  Future drawerData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    setState(() {
      final jsonResult = json.decode(data);
      myDrawerPages = jsonResult['drawer'];
    });
  }

  ToastMessage(@required var message, @required ToastGravity gravity,
      @required Color backgroundColor, @required Color textColor) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0);
  }

  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Container(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: myDrawerPages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    ToastMessage(
                        myDrawerPages[index]['pageTitle'],
                        ToastGravity.CENTER,
                        Color(0xFFF44336),
                        Color(0xFFFFEB3B));
                  },
                  title: Text(
                    myDrawerPages[index]['pageTitle'],
                    style: Constant.myStyle,
                  ),
                );
              }),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/splash.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
