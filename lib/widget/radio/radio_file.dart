import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_radio/flutter_radio.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';


class RadioFmClass extends StatefulWidget {
  @override
  _RadioFmClassState createState() => new _RadioFmClassState();
}

class _RadioFmClassState extends State<RadioFmClass> {
  String url = "https://ia802708.us.archive.org/3/items/count_monte_cristo_0711_librivox/count_of_monte_cristo_001_dumas.mp3";
//    String url = "http://server-23.stream-server.nl:8438";
  @override
  void initState() {
    super.initState();
    audioStart();
  }

  Future<void> audioStart() async {
    await FlutterRadio.audioStart();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title:   Text('Radio',style: Constant.myStyle),
        ),
        body: new Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 20,
                ),
                MaterialButton(
                  child: Icon(Icons.play_circle_filled,color: Colors.white,),
                  onPressed: () => FlutterRadio.play(url: url),
                  color: Colors.blue,
                ),
                MaterialButton(
                  child: Icon(Icons.pause_circle_filled,color: Colors.white,),
                  onPressed: () => FlutterRadio.pause(url: url),
                  color: Colors.blue,
                ),
                Container(
                  height: 20,
                )
              ],
            )
        ),
      ),
    );
  }
}
