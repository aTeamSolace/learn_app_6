import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class MyVideoPlay extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyVideoPlay> {

  File _video;

  VideoPlayerController _videoPlayerController;

  _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
    _video = video;
    _videoPlayerController = VideoPlayerController.file(_video)..initialize().then((_) {
      setState(() { });
      _videoPlayerController.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        _pickVideo();
      },
      child: Icon(Icons.add,color: Colors.white,),),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Video Player",style: Constant.myStyle),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[

//                VideoPlayer(_videoPlayerController),
                _videoPlayerController != null ?
                AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio * 2,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        _PlayPauseOverlay(controller: _videoPlayerController,),

                        VideoPlayer(_videoPlayerController),

                        VideoProgressIndicator(_videoPlayerController, allowScrubbing: true),
                      ],
                    )
                  )
                    :
                    Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.red,
                size: 100.0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
