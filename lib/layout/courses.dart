import 'dart:convert';
import 'package:learn_app_6/widget/agaro_sdk/pages/index.dart';
import 'package:learn_app_6/layout/widgets/display_container.dart';
import 'package:learn_app_6/widget/SocialLogin/Fb_login.dart';
import 'package:learn_app_6/widget/all_classes_import.dart';
import 'package:learn_app_6/permission_service/permission_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'description_page.dart';

class Courses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Courses();
  }
}

class _Courses extends State<Courses> {
  var myCoursesData = [];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      coursesData();
      permissionAcess();
    });
    super.initState();
  }

  Future permissionAcess() {
    PermissionService().requestStoragePermission(onPermissionDenied: () {});
  }

  Future coursesData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
    setState(() {
      final jsonResult = json.decode(data);
      var myCoursesData1 = jsonResult['pages'];
      var myCoursesData2 = jsonResult['widgets'];
      myCoursesData = myCoursesData1 + myCoursesData2;
    });
  }

  Future navigateToSubPage(context, int index) async {
    var array = [
      Login(),
      LoginWithFb(),
      LoginWithFb(),
      AboutUs(myData: myCoursesData[index]["pageContent"],),
      ContactUs(myData: myCoursesData[index]["pageContent"],),

      CalculatorPage(),
      CalendarEvent(),
      MyLogin(),
      GallayImages(),
      PdfReaderClass(),

      RadioFmClass(),
      ProfilePage(),
      ScanQRCode(),
      MyVideoPlay(),
      MyAudioPlayer(),

      MapSample(),
      FeedbackPage(),
      SocialConnect(),
      MapSample(),
      FloatingActionButtonLayoutOne(),
      BottomNavBarLayoutThird(),
      BottomNavBarLayoutSecond(),
      BottomNavLayoutOne(),
      WordpressPage(),
      IndexPage()
    ];
    var myInt = int.parse(myCoursesData[index]["rootClassKey"]);
    Object instance = array[myInt - 1];
    Navigator.push(context, MaterialPageRoute(builder: (context) => instance));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
        backgroundColor: Colors.white12,
        body: Container(
           decoration: BoxDecoration(
             color: Colors.black,
               image: DecorationImage(
                   image: AssetImage("assets/images/bg.png")
               )
           ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: myCoursesData.length,
            itemBuilder: (BuildContext context, int index) {
              return new DisplayContainer(
                imageUrl: myCoursesData[index]['pageUrl'],
                courseName: "",
                onTap: () {
                  if (myCoursesData[index]["rootClassKey"] == "0") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DescriptionClass(
                                  imageUrl: myCoursesData[index]['pageUrl'],
                                  courseName: myCoursesData[index]['pageTitle'],
                                  courseDescription: myCoursesData[index]['pageContent'],
                                )));
                  } else {
                    navigateToSubPage(context, index);
                  }
                },
              );
            },
          ),
        ));
  }
}
