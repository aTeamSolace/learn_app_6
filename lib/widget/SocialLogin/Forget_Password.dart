import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPassword extends StatefulWidget{
  @override
  ForgetPasswordState createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword>{
  TextEditingController email = new TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Container(
        child:
        ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/SplashScreen/Splash.png',
              height: MediaQuery.of(context).size.height * 0.25,
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                Text('Forgot your Password ?',style: GoogleFonts.ubuntuCondensed(color: Colors.black, fontSize: 24),),
                SizedBox(
                  height: 10,
                ),
                Text('Let\'s get a new one',style: GoogleFonts.ubuntuCondensed(color: Colors.black, fontSize: 18)),
                SizedBox(
                  height: 10,
                ),
                Text('Please, Enter your email address below,',style:GoogleFonts.ubuntuCondensed(color: Colors.black, fontSize: 18)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child:  new Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child:  TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
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
            ),
            SizedBox(
              height: 30,
            ),
            new Container(
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
                        'Forgot Password',
                        style: GoogleFonts.ubuntuCondensed(color: Colors.black, fontSize: 18),
                      ),
                      onPressed: () {},
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}