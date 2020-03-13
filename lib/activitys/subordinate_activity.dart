import 'package:eattendance/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubordinateActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SubordinateActivityState();
  }
}

class _SubordinateActivityState extends State<SubordinateActivity>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("List Subordinate"),
        backgroundColor: HexColor(COLOR_THEME_PRIMARY_BLUE),
        elevation: 0.0,
      ),
    );
  }
}