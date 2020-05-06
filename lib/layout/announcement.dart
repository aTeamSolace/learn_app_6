import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

import 'login_page.dart';

class Announcement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Announcement();
  }
}
class _Announcement extends State<Announcement>{
  bool pressGeoON = false;
  bool cmbscritta = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          RaisedButton(
          elevation: 0,
            color: Colors.white  ,
            textColor: Colors.white,
            child: cmbscritta ?
            Container(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.remove,color: Colors.green,),
                title: Text("Leave Group",style: Constant.myStyleGreen),
              ),
            ) :
            Container(
              width: 200,
              child: ListTile(
                leading: Icon(Icons.add,color: Colors.green,),
                title: Text("Add Group",style:  Constant.myStyleGreen),
              ),
            ),//    style: TextStyle(fontSize: 14)
            onPressed: () {
              setState(() {
//                pressGeoON = !pressGeoON;
                cmbscritta = !cmbscritta;
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              });
            }
        ),
            RaisedButton(
              color: Colors.white,
              onPressed: (){},
              elevation: 0,
              child: Container(
                width: 120,
                child: ListTile(
                  title: Text("Write a post",style: Constant.myStyleGreen),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
