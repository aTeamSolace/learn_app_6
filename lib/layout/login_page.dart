import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'signin_page.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage>{
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

//  myButton(Colors colors, var title){
//    return MaterialButton(
//      onPressed: (){},
//      color:  ,
//    );
//  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
//      backgroundColor: Colors.purpleAccent,
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
              Padding(padding: EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("Forget Password?",style: TextStyle(color: Colors.green),),
              ),),
              Container(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: (){},
                  child: Text("LOGI N"),
                  color: Colors.green,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
//                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesome.apple),
                      Container(
                        width: 15,
                      ),
                      Text("Sign In Apple")
                    ],
                  ),
                  color: Colors.grey,
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width / 2,
//                height: 40,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  onPressed: (){},
                  child: Row(
                    children: <Widget>[
                      Icon(FontAwesome.facebook),
                      Container(
                        width: 15,
                      ),
                      Text("Sign In Facebook")
                    ],
                  ),
                  color: Colors.blueAccent,
                ),
              ),
              Container(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: new RichText(
                text: new TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.black),

                  children: <TextSpan>[
                    new TextSpan(
                        text: 'Register',
                        style: new TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
//                    new TextSpan(text: 'Register'),
                  ],
                ),
              ),
              ),
              Container(
                height: 30,
              ),

              
            ],
          ),
        )
      ),
    );
  }
}