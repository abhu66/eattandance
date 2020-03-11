import 'package:eattendance/constants.dart';
import 'package:eattendance/widget/widget_dashboard.dart';
import 'package:eattendance/widget/widget_overtime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OvertimeActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OvertimeActivityState();
  }
}

class _OvertimeActivityState extends State<OvertimeActivity> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: HexColor(COLOR_LIGHT_GREY),
      appBar: AppBar(
        backgroundColor: HexColor(COLOR_THEME_PRIMARY_BLUE),
        title: Text(
          "Overtime",
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
            WidgetOvertime(),
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
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          new Icon(
                            Icons.access_time,
                            color: HexColor(COLOR_THEME_PRIMARY_BLUE),
                            size: 50.0,
                          ),
                          Text(
                            "Overtime",
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.black),
                          )
                        ],
                      ),
                    ))),
          ]),
        ),
      ),
    );
  }
}
