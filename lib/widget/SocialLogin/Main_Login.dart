import 'dart:convert';
import 'package:learn_app_6/layout/botton_nav.dart';
import 'package:flutter/material.dart';
import 'Main_Signup.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'Forget_Password.dart';
import 'Update_Profile.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';
class Login extends StatefulWidget {
  @override
  LoginState createState() => new LoginState();
}

class LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailid = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool validate = false;

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  String msg = '';

  @override
  void dispose() {
    emailid.dispose();
    password.dispose();
    super.dispose();
  }

  static showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel",style: Constant.myStyle,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue",style: Constant.myStyle),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(
          "Would you like to continue learning how to use Flutter alerts?",style: Constant.myStyle),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static final GlobalKey _menuKey = new GlobalKey();

  final setting = PopupMenuButton<int>(
    key: _menuKey,
    itemBuilder: (context) => [
      PopupMenuItem(
          value: 1,
          child: ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
              size: 24,
            ),
            title: Text('Update Profile',style: Constant.myStyle),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UpdateProfile()));
            },
          )),
      PopupMenuItem(
          value: 2,
          child: ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 24,
            ),
            title: Text('Signout',style: Constant.myStyle),
            onTap: () {
              showAlertDialog;
            },
          )),
    ],
  );

  Widget _childPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "Earth",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Moon",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Text(
              "Sun",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    final Size screenSize = media.size;
    return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                   _childPopup();
                })
          ],
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => BottomNavPage(initialIndex:0 ,)));
              }),
          automaticallyImplyLeading: false,
          title: new Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Form(
                  //  key: this._formKey,
                  child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowGlow();
                },
                child: new ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Image.asset(
                      'assets/SplashScreen/Splash.png',
                      height: MediaQuery.of(context).size.height * 0.25,
                    ),
                    SizedBox(
                      height: 20.0,
                      width: 20,
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailid,
                        decoration: new InputDecoration(
                            hintText: 'you@example.com',
                            labelText: 'E-mail Address',
                            errorText:
                                validate ? "Email can\'t be empty" : null,
                            icon: new Icon(
                              Icons.email,
                              color: Colors.blue[400],
                            )),
                      ),
                    ),
                    new Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: new InputDecoration(
                            hintText: 'Password',
                            labelText: 'Enter your password',
                            errorText:
                                validate ? "Password can\'t be empty" : null,
                            icon: new Icon(
                              Icons.lock,
                              color: Colors.blue[400],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()));
                        },
                        child: RichText(
                            text: TextSpan(
                                text: 'Forgot Password',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            decoration: BoxDecoration(
                              borderRadius: new BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                  offset: new Offset(4.0, 3.0),
                                ),
                              ],
                            ),
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: const EdgeInsets.only(left: 0.0, top: 20.0),
                            child: new RaisedButton(
                              child: new Text(
                                'Login',
                                style: new TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              onPressed: () {
                                mainLogin();
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0)),
                              splashColor: Colors.cyan,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: new Column(
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),

                          Text(
                            'Or',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                          Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    offset: new Offset(4.0, 3.0),
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/LoginScreen/google_logo.png',
                                      color: Colors.white,
                                      height: 22,
                                      width: 22,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Login with Google',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)))
                                  ],
                                ),
                              )),

                          SizedBox(
                            height: 5,
                          ),

                          Text(
                            'Or',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                          Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.7,
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(25.0),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3.0,
                                    offset: new Offset(4.0, 3.0),
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: null,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/fb.png',
                                      color: Colors.white,
                                      height: 22,
                                      width: 22,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: 'Login with Facebook',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)))
                                  ],
                                ),
                              )),

                          SizedBox(
                            height: 12,
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'New User? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                  children: <TextSpan>[
                                    new TextSpan(
                                        text: 'Sign Up',
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.blue)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
        ));
  }


  Future<List> _login() async {
    final response = await http.post(
        "https://goflite.goappz.us/flite_api/v1/authentication/signin",
        body: {
          "email": emailid.text,
          "password": password.text,
        });

    var datauser = json.decode(response.body);

    if (datauser.length == 0) {
      setState(() {
        msg = "Login Fail";
      });
    } else {

//      Navigator.pushReplacement(
//          context,
//          MaterialPageRoute(
//              builder: (context) => MyApp()));
    }
    return datauser;
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Error Alert"),
          content: new Text("Please enter correct email and password"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future verifyUser() async {
    final url = "https://goflite.goappz.us/flite_api/v1/authentication/signin";

    final response = await http.post(url, body: {
      "email": emailid.text,
      "password": password.text,
    });

    var responsemsg = (response.body);

    if(responsemsg == '1'){
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => MyApp(
//            ),
//          ));
    }
    else{
      _showDialog();
    }
    return responsemsg;
  }


  Future<List> mainLogin() async {
    final response = await http.post("https://goflite.goappz.us/flite_api/v1/authentication/signin", body: {
      "email": emailid.text,
      "password": password.text,
    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
//      Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => MyApp(
//            ),
//          ));
      }
    return datauser;
    }
  }