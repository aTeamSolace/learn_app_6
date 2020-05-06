import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool terms = false;
  bool privacy = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Text("OXFORD University",style: TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                ),),
                Container(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                ),
                Container(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                Container(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.purpleAccent,
                      value: terms,
                      onChanged: (bool value) {
                        setState(() {
                          terms = value;
                        });
                      },
                    ),
                    Text("I accept the terms of use"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Checkbox(
                      activeColor: Colors.purpleAccent,
                      value: privacy,
                      onChanged: (bool value) {
                        setState(() {
                          privacy = value;
                        });
                      },
                    ),
                     Text("I accept the privacy and policy"),
                  ],
                ),
                 Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    onPressed: (){},
                    child: Text("SIGN IN"),
                    color: Colors.green,
                  ),
                ),
                Container(
                  height: 40,
                ),
                 InkWell(child:
                new RichText(
                  text: new TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.black),
                     children: <TextSpan>[
                      new TextSpan(
                          text: 'Login',
                          style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
//                    new TextSpan(text: 'Register'),
                    ],
                  ),
                ),
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              Container(height: 30,)
              ],
            ),
          )
      ),
    );
  }
}