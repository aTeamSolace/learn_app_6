//import 'package:flutter/material.dart';
//import 'package:qrcode_reader/qrcode_reader.dart';
//
//class ScanQRCode extends StatefulWidget {
//  @override
//  _ScanQRCodeState createState() => _ScanQRCodeState();
//}
//
//class _ScanQRCodeState extends State<ScanQRCode> {
//  String scannedString = '';
//
//  _scanQR() async {
//    setState(() async {
//      scannedString = await new QRCodeReader().scan();
//     });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Scan QR Code')),
//      body: Center(
//        child:  Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              scannedString,
//              style: TextStyle(
//                fontSize: 17.0,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//            Container(
//              height: 50,
//            ),
//            RaisedButton(
//              child: Text('Scan QR Code'),
//              color: Colors.red,
//              onPressed: _scanQR,
//            )
//          ],
//        )
//      ),
//    );
//  }
//}
//import 'package:flutter/material.dart';
////import 'package:qrscan/qrscan.dart' as scanner;
//
//class ScanQRCode extends StatefulWidget {
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<ScanQRCode> {
//  String scanResult = '';
//
//  //function that launches the scanner
//  Future scanQRCode() async {
//    String cameraScanResult;
////    = await scanner.scan();
//    setState(() {
//      scanResult = cameraScanResult;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('QR Scan Demo'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            scanResult == '' ? Text('Result will be displayed here') : Text(scanResult),
//            SizedBox(height: 20),
//            RaisedButton(
//              color: Colors.blue,
//              child: Text('Click To Scan', style: TextStyle(color: Colors.white),),
//              onPressed: scanQRCode,
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}





import 'dart:async';
import 'package:learn_app_6/layout/widgets/constant.dart';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanQRCode extends StatefulWidget {
  @override
  _ScanQRCodeState createState() => new _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Barcode Scanner',style: Constant.myStyle),
            centerTitle: true,
          ),
          body: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  child: new MaterialButton(
                      onPressed: scan, child: new Text("Scan",style: Constant.myStyle)),
                  padding: const EdgeInsets.all(8.0),
                ),
                new Text(barcode),
              ],
            ),
          )),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}