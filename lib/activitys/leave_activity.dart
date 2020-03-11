import 'package:eattendance/constants.dart';
import 'package:eattendance/widget/widget_dashboard.dart';
import 'package:eattendance/widget/widget_leave.dart';
import 'package:eattendance/widget/widget_leave_balance.dart';
import 'package:eattendance/widget/widget_overtime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaveActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LeaveActivityActivityState();
  }
}

class _LeaveActivityActivityState extends State<LeaveActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor(COLOR_LIGHT_GREY),
      appBar: AppBar(
        backgroundColor: HexColor(COLOR_THEME_PRIMARY_BLUE),
        title: Text(
          "Leave",
          style: TextStyle(fontSize: 18.0),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(children: <Widget>[
            WidgetLeave(),
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  labelText: "CREATE NEW",
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    //Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
                  });
                },
                child: Container(
                    padding: EdgeInsets.only(left: 18, top: 10),
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            new Icon(
                              Icons.directions_walk,
                              color: HexColor(COLOR_THEME_PRIMARY_BLUE),
                              size: 50.0,
                            ),
                            Text(
                              "Leave Application",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: <Widget>[
                            new Icon(
                              Icons.exit_to_app,
                              color: HexColor(COLOR_THEME_PRIMARY_BLUE),
                              size: 50.0,
                            ),
                            Text(
                              "Whereabout",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                ),
            ),
            WidgetLeaveBalance(),
          ]),
        ),
      ),
    );
  }
}
