import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetDashboardState();
  }
}

class _WidgetDashboardState extends State<WidgetDashboard> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 170,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Wrap(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffF3F3FE),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.event_available,size: 40,),
                    color: Color(0xff415EF6),
                    onPressed: () {},
                  )),
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffEEFBFA),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.access_time,size: 40),
                    color: Color(0xff415EF6),
                    onPressed: () {},
                  )),
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFF3F3),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.directions_walk,size: 40),
                    color: Color(0xffFD706B),
                    onPressed: () {},
                  )),
              Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffEEFBFA),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.list,size: 40),
                    color: Color(0xffFD706B),
                    onPressed: () {},
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: 60,
                  height: 60,
                  child: Center(child : Text("Attandance"))
              ),
              Container(
                  width: 60,
                  height: 60,
                  child: Center(child : Text("Overtime"))
              ),
              Container(
                  width: 60,
                  height: 60,
                  child: Center(child : Text("Leave"))
              ),
              Container(
                  width: 60,
                  height: 60,
                  child:Center(child : Text("Other"))
              ),
            ],
          ),
        ],
      ),
    );
  }
}
