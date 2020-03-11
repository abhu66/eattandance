
import 'package:eattendance/constants.dart';
import 'package:eattendance/utils/date_format.dart';
import 'package:eattendance/widget/widget_checkin_checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AttendanceActivityState();
  }
}

class _AttendanceActivityState extends State<AttendanceActivity> {
  bool _isCheckIn = false;
  String timeAt;
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
                                _isCheckIn == true ? _isCheckIn = false : _isCheckIn = true;
                                timeAt = new DateFormat.jm().format(DateTime.now()).toString();
                                //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
                              });
                            },
                            child: new Icon(Icons.play_circle_outline,color: _isCheckIn == true ? Colors.red : Colors.yellow,size: 150.0,)
                        ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),Flexible(
                                  child: Text(
                                    "Plaza Aminta, 3rd fl, Suit 304 ",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Color(0xff415EF6)),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        _isCheckIn == false ? Container(
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
                        Container(
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
                        ),

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

  Widget _formLogin() {
    return Column(
      children: <Widget>[
        new Form(
          // key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                //onSaved: (val) => username = val,
//                validator: (val) {
//                  return val.length < 10
//                      ? "Username or email is required."
//                      : null;
//                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Comment',
                ),
              ),
//              SizedBox(height: 20,),
//              new TextFormField(
//                onSaved: (val) => password = val,
//                validator: (val) {
//                  return val.length < 5
//                      ? "Password is required."
//                      : null;
//                },
//                textAlign: TextAlign.center,
//                obscureText: true,
//                decoration: new InputDecoration(
//                  hintText: "Password",
//                ),
//              ),
            ],
          ),
        ),
      ],
    );
  }
}
