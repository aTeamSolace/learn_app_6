import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';


class MyAudioPlayer extends StatefulWidget {

  @override
  _MyAudioPlayerState createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  bool _isPlaying = false;
  AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  playAudioFromLocalStorage(path) async {
    int response = await audioPlayer.play(path, isLocal: true);
    if (response == 1) {
      // success
    } else {
      print('Some error occured in playing from storage!');
    }
  }

  pauseAudio() async {
    int response = await audioPlayer.pause();
    if (response == 1) {
      // success
    } else {
      print('Some error occured in pausing');
    }
  }

  stopAudio() async {
    int response = await audioPlayer.stop();
    if (response == 1) {
      // success
    } else {
      print('Some error occured in stopping');
    }
  }

  resumeAudio() async {
    int response = await audioPlayer.resume();
    if (response == 1) {
      // success
    } else {
      print('Some error occured in resuming');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Audio Player",style: Constant.myStyle,),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          if (_isPlaying == true) {
                            pauseAudio();
                            setState(() {
                              _isPlaying = false;
                            });
                          } else {
                            resumeAudio();
                            setState(() {
                              _isPlaying = true;
                            });
                          }
                        },
                        child:
                        Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                        color: Colors.blue,
                      ),
                      RaisedButton(
                        onPressed: () {
                          stopAudio();
                          setState(() {
                            _isPlaying = false;
                          });
                        },
                        child: Icon(Icons.stop),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  onPressed: () async {
                    var path =
                    await FilePicker.getFilePath(type: FileType.audio);

                    setState(() {
                      _isPlaying = true;
                    });
                    playAudioFromLocalStorage(path);
                  },
                  child: Text(
                    'Load Audio File',
                       style: Constant.myStyle
                  ),
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}