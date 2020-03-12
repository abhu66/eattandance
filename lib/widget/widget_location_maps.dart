


import 'dart:async';

import 'package:eattendance/location_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetLocationMaps extends StatefulWidget{
  WidgetLocationMaps({Key key, this.userLocation,this.addressLine}) : super(key:key);
  final UserLocation userLocation;
  final String addressLine;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetLocationMapsState();
  }
}

class _WidgetLocationMapsState extends State<WidgetLocationMaps>{

  Completer<GoogleMapController> _mapController = Completer();
  final Map<String, Marker> _markers = {};
  LatLng _currentPosition;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        bottomOpacity: 0.0,
        title: Text("Current Location",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(icon: Icon(Icons.clear),color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
        child : Stack(
        children: <Widget>[
          Container(
            child: buildGooglMap(context),
          ),
          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.location_on),
                          hintText:  widget.addressLine,
                          hintMaxLines: 20,
                          hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget buildGooglMap(BuildContext context) {
    return Container(
      child: GoogleMap(
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
        },
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.userLocation.latitude, widget.userLocation.longitude),
          zoom: 17.0,
        ),
        markers: _markers.values.toSet(),
      ),
    );
  }
  
}