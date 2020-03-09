

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetDashboardState();
  }
}

class _WidgetDashboardState extends State<WidgetDashboard>{
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
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffF3F3FE),
                    ),
                    child : IconButton(
                      icon : Icon(Icons.event_available),
                      color: Color(0xff415EF6),
                      onPressed: (){
//                        Navigator.of(context).push(
//                            new MaterialPageRoute(
//                                builder: (context) => new GreatHistoryActivity(user: widget.user,)
//                            )
//                        );
                      },
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'Attandance',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffEEFBFA),
                    ),
                    child: IconButton(
                      icon : Icon(Icons.access_time),
                      color: Color(0xff415EF6),
                      onPressed: (){
                       // openBottomSheet(context);
                      },
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'Overtime',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFF3F3),
                    ),
                    child: Icon(
                      Icons.directions_walk,
                      color: Color(0xffFD706B),
                      size: 32,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'Leave',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffFFF3F3),
                    ),
                    child: Icon(
                      Icons.list,
                      color: Color(0xffFD706B),
                      size: 32,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'Other',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}