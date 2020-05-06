import 'dart:convert';
import 'package:learn_app_6/layout/widgets/constant.dart';

import 'package:learn_app_6/permission_service/permission_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class GiveToSchool extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GiveToSchool();
  }
}

class _GiveToSchool extends State<GiveToSchool> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      permissionAcess();
      coursesData();
    });
    super.initState();
  }

  Future permissionAcess() {
    PermissionService().requestStoragePermission(onPermissionDenied: () {});
  }

  var myCoursesData = [];
  var myData;

  Future coursesData() async {
    var data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    setState(() {
      var jsonResult = json.decode(data);

      myCoursesData = jsonResult['home'];
      myData = myCoursesData[0]['pageContent'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white12,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: Image.asset("assets/splash.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Html(
                    defaultTextStyle: Constant.myStyle,
                    data:
                        """                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                    ${myData}
                    """,
                    padding: EdgeInsets.all(8.0),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
