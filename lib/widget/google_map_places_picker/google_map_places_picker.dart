//import 'package:flutter/material.dart';
//import 'package:google_maps_place_picker/google_maps_place_picker.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//
//
//class GoogleMapPlacesPickerClass extends StatefulWidget {
//  const GoogleMapPlacesPickerClass({Key key}) : super(key: key);
//
//  static final kInitialPosition = LatLng(-33.8567844, 151.213108);
//
//  @override
//  _GoogleMapPlacesPickerClassState createState() => _GoogleMapPlacesPickerClassState();
//}
//
//class _GoogleMapPlacesPickerClassState extends State<GoogleMapPlacesPickerClass> {
//  PickResult selectedPlace;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text("Google Map Place Picer Demo"),
//        ),
//        body: Center(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              RaisedButton(
//                child: Text("Load Google Map"),
//                onPressed: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) {
//                        return PlacePicker(
//                          apiKey: "AIzaSyBIzJdSxuK1chdYOdrz2f1VYGqb3glCCqo",
//                          initialPosition: GoogleMapPlacesPickerClass.kInitialPosition,
//                          useCurrentLocation: true,
//                          //usePlaceDetailSearch: true,
//                          onPlacePicked: (result) {
//                            selectedPlace = result;
//                            Navigator.of(context).pop();
//                            setState(() {});
//                          },
//                          autocompleteLanguage: "ko",
//                        );
//                      },
//                    ),
//                  );
//                },
//              ),
//              selectedPlace == null ? Container() : Text(selectedPlace.formattedAddress ?? ""),
//            ],
//          ),
//        ));
//  }
//}