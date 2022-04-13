import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();


    List<Map> latLangList=[
      {"id":"1",
        "lat":"12.9610",
        "lang":"77.6387"},
      {
        "id":"2",
        "lat":"12.968165",
        "lang":"77.631801"},
      {
        "id":"3",
        "lat":"12.964897",
        "lang":"77.633897"},
      {
        "id":"4",
        "lat":"12.966897",
        "lang":"77.633897"},
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Center(

        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: CameraPosition(
            target: LatLng(12.9610, 77.6387),
            zoom: 10,
          ),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers:latLangList.map((e) =>
              Marker(markerId:MarkerId(e["id"].toString()),
                  position: LatLng(double.parse(e["lat"]),double.parse(e["lang"])),
                  onTap: (
                      ){
                    print(e["lat"]+"  "+e["lang"]);
                  }

              )
          ).toSet() ,
        ),
      ),

    );
  }
}