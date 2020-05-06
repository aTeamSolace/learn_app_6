import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateProfile extends StatefulWidget{
  @override
  UpdateState createState() => UpdateState();
}

class UpdateState extends State<UpdateProfile>{

  @override
  initState(){
    super.initState();
  }

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController cnfPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title:Text('Update Profile',style: TextStyle(color: Colors.white,fontSize: 18),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: null),
      ),
      body: SafeArea(child:
         Container(
           child:  ListView(
             children: <Widget>[
               new Container(
                 padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                 child:  TextField(
                   controller: firstName,
                   decoration: new InputDecoration(
                       hintText: 'Abc',
                       labelText: 'First Name',
                       icon: new Icon(
                         Icons.account_circle,
                         color: Colors.blue[400],
                       )),
                 ),
               ),

               new Container(
                 padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                 child:  TextField(
                   controller: lastName,
                   decoration: new InputDecoration(
                       hintText: 'PQR',
                       labelText: 'Last Name',
                       icon: new Icon(
                         Icons.account_circle,
                         color: Colors.blue[400],
                       )),
                 ),
               ),

               new Container(
                 padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10),
                 child:  TextField(
                   enabled: false,
                   keyboardType: TextInputType.emailAddress,
                   controller: email,

                   decoration: new InputDecoration(
                       hintText: 'abc.pqr@gmail.com',
                       icon: new Icon(
                         Icons.email,
                         color: Colors.blue[400],
                       )),
                 ),
               ),

               new Container(
                 padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                 child:  TextField(
                   controller: password,
                   decoration: new InputDecoration(
                       labelText: 'Password',
                       hintText: '********',
                       icon: new Icon(
                         Icons.lock_outline,
                         color: Colors.blue[400],
                       )),
                 ),
               ),

               new Container(
                 padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10),
                 child:  TextField(
                   controller: cnfPassword,
                   decoration: new InputDecoration(
                       labelText: 'Confirm Password',
                       hintText: '********',
                       icon: new Icon(
                         Icons.lock_outline,
                         color: Colors.blue[400],
                       )),
                 ),
               ),

             SizedBox(
               height: 30,
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
                   child:
                   MaterialButton(
                     onPressed: null,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         SizedBox(
                           width: 10,
                         ),
                         RichText(
                             text: TextSpan(
                                 text: 'Update Profile',
                                 style: TextStyle(
                                     fontSize: 18,
                                     color: Colors.white)))
                       ],
                     ),
                   )
               ),
             ],
           ),
         )
      ),
    );
  }
}