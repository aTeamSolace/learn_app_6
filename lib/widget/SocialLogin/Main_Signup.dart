import 'dart:convert';
import 'package:flutter/material.dart';
 import 'package:http/http.dart' as http;
import 'package:learn_app_6/layout/widgets/constant.dart';

import 'Main_Login.dart';

class SignUp extends StatefulWidget {
  @override
  SignUpState createState() => new SignUpState();
}

class SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController emailid = new TextEditingController();
  TextEditingController password = new TextEditingController();

  bool validate = false;
  String msg='';

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    emailid.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    final Size screenSize = media.size;
    return new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: new Text(
              'Sign Up',
              style: Constant.myStyle,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Form(
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
                          child:  TextField(
                            controller: firstName,
                            decoration: new InputDecoration(
                                hintText: 'Abc',
                                labelText: 'First Name',
                                errorText: validate ? "First Name can\'t be empty" : null,
                                icon: new Icon(
                                  Icons.account_circle,
                                  color: Colors.blue[400],
                                )),
                          ),
                        ),

                        new Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child:  TextField(
                            controller: lastName,
                            decoration: new InputDecoration(
                                hintText: 'PQR',
                                labelText: 'Last Name',
                                errorText: validate ? "Last Name can\'t be empty" : null,
                                icon: new Icon(
                                  Icons.account_circle,
                                  color: Colors.blue[400],
                                )),
                          ),
                        ),

                        new Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child:  TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailid,
                            decoration: new InputDecoration(
                                hintText: 'you@example.com',
                                labelText: 'E-mail Address',
                                errorText: validate ? "Email can\'t be empty" : null,
                                icon: new Icon(
                                  Icons.email,
                                  color: Colors.blue[400],
                                )),
                          ),
                        ),

                        new Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          child:
                          TextField(
                            controller: password,
                            obscureText: true,
                            decoration: new InputDecoration(
                                hintText: 'Password',
                                labelText: 'Enter your password',
                                errorText: validate ? "Password can\'t be empty" : null,
                                icon: new Icon(
                                  Icons.lock,
                                  color: Colors.blue[400],
                                )),
                          ),
                        ),

                        SizedBox(
                          height: 10,
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
                                child:
                                new RaisedButton(
                                  child: new Text(
                                    'Sign Up',
                                    style: new TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  onPressed: () {

                                    setState(() {
                                      firstName.text.isEmpty
                                          ? validate = true
                                          : validate = false;
                                      lastName.text.isEmpty
                                          ? validate = true
                                          : validate = false;
                                      emailid.text.isEmpty
                                          ? validate = true
                                          : validate = false;
                                      password.text.isEmpty
                                          ? validate = true
                                          : validate = false;

                                      var verifyResult = verifyUser();
                                       if (firstName.text.isNotEmpty && lastName.text.isNotEmpty && emailid.text.isNotEmpty && password.text.isNotEmpty) {
                                        goToHomePage(context);
                                      }
                                    });
                                  },
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(30.0)),
                                  splashColor: Colors.cyan,
                                ),
                              ),
                            ],
                          ),
                        ),

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
                                      builder: (context) => Login()));
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account? ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Login',
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
                  ))),
        ));
  }

  Future<List> _login() async {
    final response = await http.post("https://goflite.goappz.us/flite_api/v1/authentication/signin", body: {
      "username": emailid.text,
      "password": password.text,
    });

    var datauser = json.decode(response.body);
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
    }
    return datauser;
  }

  void goToHomePage(BuildContext context) {

    if (firstName.text.isNotEmpty && lastName.text.isNotEmpty && emailid.text.isNotEmpty && password.text.isNotEmpty) {
      if (password.text == "123456") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(
              ),
            ));
      } else {
        _showDialog();
      }
    }
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
    final url = "https://goappz.us/latecomers/timer_api.php";
    final response = await http.post(url, body: {
      "firstname" : firstName.text,
      "lastname" : lastName.text,
      "username": emailid.text,
      "password": password.text,
    });

    var responsemsg = (response.body);
    return responsemsg;
  }
}