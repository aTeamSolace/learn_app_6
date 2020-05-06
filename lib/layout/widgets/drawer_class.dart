import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DrawerClass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DrawerClass();
  }
}
class _DrawerClass extends State<DrawerClass>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: Container(
//          color: Colors.black,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(FontAwesome.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(FontAwesome.share),
                title: Text("Share"),
              ),
            ],
          ),
        ),
    );
  }
}