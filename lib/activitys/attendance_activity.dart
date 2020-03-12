
import 'dart:async';

import 'package:eattendance/constants.dart';
import 'package:eattendance/database/database_helper.dart';
import 'package:eattendance/models/checkin_response.dart';
import 'package:eattendance/utils/date_format.dart';
import 'package:eattendance/widget/widget_checkin_checkout.dart';
import 'package:eattendance/widget/widget_location_maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:eattendance/location_service.dart';

class AttendanceActivity extends StatefulWidget {

  AttendanceActivity({Key key, this.userLocation}) : super(key:key);
  final UserLocation userLocation;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttendanceActivityState();
  }
}

class _AttendanceActivityState extends State<AttendanceActivity> {
  bool _isCheckIn = false;
  bool _isVisibleCheckoutComment = false;
  bool _isVisibleCheckInComment = false;
  String timeAt;
  String officeLocation = "";
  CheckInRes checkInRes;


  @override
  void initState(){
    super.initState();
    _reverseCoordinateToAddress(widget.userLocation);
    _getCheckIn();

  }

  _getCheckIn() async{
    var db = new DatabaseHelper();
    var isCheckedIn = await db.isCheckIn();
    if(isCheckedIn){
      var res = await db.getCheckIn();
      setState(() {
        checkInRes = res;
        print("Ress : "+res.status);
        if(checkInRes.status == "" || checkInRes.status == 'false') {
          _isCheckIn = false;
          _isVisibleCheckoutComment = true;
        }
        else {
          print("Date : "+res.checkInAt);
          _formateStringToDate(res.checkInAt);
          _isCheckIn = true;
          _isVisibleCheckInComment = true;
        }
      });
    }
    else {
      setState(() {
        _isCheckIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor(COLOR_LIGHT_GREY),
      appBar: AppBar(
        backgroundColor: HexColor(COLOR_THEME_PRIMARY_BLUE),
        title: Text(
          "Attendence",
          style: TextStyle(fontSize: 18.0),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // _widgetUtil.showAlertLogout(context, widget.user);
            },
            icon: ImageIcon(AssetImage("assets/images/qr_code_scan.png")),
            tooltip: "QR Code",
          ),
          IconButton(
            onPressed: () {
              // _widgetUtil.showAlertLogout(context, widget.user);
            },
            icon: Icon(
              Icons.assessment,
              color: Colors.white,
            ),
            tooltip: "Attendence",
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  ClipPath(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top,
                              bottom: 20),
                          decoration: BoxDecoration(
                            color: HexColor(COLOR_THEME_PRIMARY_BLUE),
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 20, 16, 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        child: Text(
                                      new DateFormat.jm()
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        new DateFormat.EEEE()
                                            .format(DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        DateFormatUtil.fullDate(DateTime.now()),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Center(child : InkWell(
                            onTap: (){
                              setState(() {
                                //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
                              });
                            },
                            child: new Icon(Icons.play_circle_outline,color: _isCheckIn == true ? Colors.red : Colors.yellow,size: 150.0,)
                        ),
                        ),
                        Container(
                          width: 300,
                          color: Colors.transparent,
                          child : InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.downToUp,
                                      child: new WidgetLocationMaps(
                                        userLocation: widget.userLocation,addressLine: officeLocation,
                                      )));
                            },
                            child : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),Flexible(
                                  child: Text(
                                    officeLocation,
                                    style: TextStyle(
                                        fontSize: 18.0, color: Color(0xff415EF6)),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                              ),
                            ],
                          ),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        _isVisibleCheckoutComment == true ? Container(
                          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          child :
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  ImageIcon(AssetImage("assets/images/dot.png"),
                                    color:  Colors.red,size: 20,),
                                  SizedBox(width: 10,),
                                  Flexible(
                                      child: Text(
                                        "Check Out at $timeAt",
                                        style: TextStyle(
                                            fontSize: 18.0, color: Color(0xff415EF6)),
                                      )),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 18, right: 18),
                                child:
                                TextField(
                                  decoration:
                                  InputDecoration(suffixIcon: Icon(Icons.edit),
                                      hintText: "Comment"
                                  ),
                                ),
                              )
                            ],
                          ),
                        ) : Text(""),
                        _isVisibleCheckInComment == true ? Container(
                          padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                          child :
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[

                                  ImageIcon(AssetImage("assets/images/dot.png"),
                                    color:  Colors.yellow,size: 20,),
                                  SizedBox(width: 10,),
                                  Flexible(
                                      child: Text(
                                        "Check In at $timeAt",
                                        style: TextStyle(
                                            fontSize: 18.0, color: Color(0xff415EF6)),
                                      )),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 18, right: 18),
                                child:
                                TextField(
                                  decoration:
                                  InputDecoration(suffixIcon: Icon(Icons.edit),
                                  hintText: "Comment"
                                  ),
                                ),
                              )
                            ],
                          ),
                        ) : Text(""),
                      ],
                    ),
                    // clipper: CurveShape(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  _reverseCoordinateToAddress(UserLocation userLocation) async{
    // From coordinates

    final coordinates = new Coordinates(userLocation.latitude,userLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    setState(() {
      officeLocation = "${first.addressLine}";
    });
    print("${first.featureName} : ${first.addressLine}");
    print("${first.postalCode} : ${first.thoroughfare}");
    print("${first.adminArea} : ${first.subAdminArea}");
    print("${first.locality} : ${first.subLocality}");
  }

  _formateStringToDate(String s){
    DateTime todayDate = DateTime.parse(s);
    setState(() {
      timeAt = new DateFormat.jm().format(todayDate).toString();
    });
  }


//  openBottomSheetGmaps(BuildContext context) {
//    showModalBottomSheet(
//        isScrollControlled: true,
//        context: context,
//        backgroundColor: Colors.transparent,
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
//        ),
//        builder: (BuildContext context) => Wrap(children: [
//          WidgetLocationMaps(userLocation: widget.userLocation,addressLine: officeLocation,),
//        ]));
//  }
}
