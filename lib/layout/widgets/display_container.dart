import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class DisplayContainer extends StatelessWidget {
  final VoidCallback onTap;
  String imageUrl;
  String courseName;
  DisplayContainer({this.imageUrl,this.courseName,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
    child:  Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
              color: Colors.grey,
              offset: Offset(5, 8),
              blurRadius: 10,
              spreadRadius: 0.1
          )]
      ),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
            left: 25,
            top: 20,
            child: InkWell(
            onTap: onTap,
            child:  Hero(
              tag: courseName,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      imageUrl,
//                    fit: BoxFit.contain,
                    ),
                  )
                ),
              ),
            ),
          ),),
          Align(alignment: Alignment.bottomCenter,child: Text(courseName,
            style: GoogleFonts.ubuntuCondensed(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),)
//          Positioned(child:
//            left: 20,
//            bottom: 10,)
        ],
      ),
    ));

  }
}


class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key key, this.photo, this.onTap, this.width }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}