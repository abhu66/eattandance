import 'dart:convert';

import 'package:eattendance/activitys/attendance_activity.dart';
import 'package:eattendance/database/database_helper.dart';
import 'package:eattendance/models/checkin_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:eattendance/location_service.dart';

class WidgetCheckInOut extends StatefulWidget {
  WidgetCheckInOut({Key key,this.isCheckIn}) : super(key:key);
  final bool isCheckIn;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetCheckInOutState();
  }
}

class _WidgetCheckInOutState extends State<WidgetCheckInOut> {
  bool _isLoading = false;
  bool _isCheckIn = false;
  String currentLocation = "";
  CheckInRes checkInRes;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var userLocation = Provider.of<UserLocation>(context);
    return Container(
      height: 170,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child :Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Text(
                  _isCheckIn == true ? "Check Out" : "Check In",
                  style: TextStyle(
                      color: Color(0xff64676F),
                      fontFamily: 'Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child:  Container(
              width: 200.0,
              child:Row(
                children: <Widget>[
                  Flexible(child : Text(
                      _isCheckIn == true ? "Don't forget to check out." : "You haven't check in yet.",
                      style: TextStyle(
                        color: Color(0xff64676F),
                        fontFamily: 'Regular',
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                ],
              ),
            )
          ),
          Positioned(
              right: -10.0,
              top: -10.0,
              child:InkWell(
                  onTap: (){
                    _isCheckIn == false ? _checkIn(userLocation) : _checkOut(userLocation);
                    Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity(userLocation: userLocation)));
                  },
                  child: new Icon(Icons.play_circle_outline,color: _isCheckIn == true ? Colors.red : Colors.yellow,size: 120.0,)
              )
          ),
          Positioned(
            left: 0.0,
            bottom: 10.0,
            child:  Container(
              width: 200.0,
              child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    _isCheckIn == true ? "Have a good day!" : "",
                    style: TextStyle(
                      color: Color(0xff64676F),
                      fontFamily: 'Regular',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }

  _reverseCoordinateToAddress(UserLocation userLocation) async{
    // From coordinates
    final coordinates = new Coordinates(userLocation.latitude,userLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      currentLocation = "${first.addressLine}";
    });
    print("${first.featureName} : ${first.addressLine}");
    print("${first.postalCode} : ${first.thoroughfare}");
    print("${first.adminArea} : ${first.subAdminArea}");
    print("${first.locality} : ${first.subLocality}");
  }

  _checkIn(UserLocation userLocation) async {
    var db = new DatabaseHelper();
    // _reverseCoordinateToAddress(userLocation);
    var checkInRes = json.encode(
        {"checkInAt" : DateTime.now().toString(),
          "checkOutAt" : null,
          "comment":"",
          "latLong":LatLng(userLocation.latitude,userLocation.longitude).toString(),
          "status":"true"});
    print("LATlONG : "+LatLng(userLocation.latitude,userLocation.longitude).toString());
    await db.saveCheckIn(checkInResFromJson(checkInRes));
    setState(() {
      _isCheckIn = true;
    });
    print("Sukses Checkin");
  }

  _checkOut(UserLocation userLocation) async {
    var db = new DatabaseHelper();
    var res = await db.getCheckIn();
    // _reverseCoordinateToAddress(userLocation);
    // _reverseCoordinateToAddress(userLocation);
    var checkInRes = json.encode(
        {"checkInAt" : res.checkInAt,
          "checkOutAt" : DateTime.now().toString(),
          "comment":"",
          "latLong":res.latLong,
          "status":"false"});
    print("LATlONG : "+LatLng(userLocation.latitude,userLocation.longitude).toString());
    await db.saveCheckOut(checkInResFromJson(checkInRes),int.parse(res.id));
    setState(() {
      _isCheckIn = false;
    });
    print("Sukses CheckOut");
  }
}
