import 'package:eattendance/activitys/attendance_activity.dart';
import 'package:eattendance/activitys/overtime_activity.dart';
import 'package:eattendance/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WidgetLeave extends StatefulWidget {
  final dashboardItem = [
    new DashboardItem("My Subscription", Icons.format_indent_increase, Color(0xffF3F3FE),
        Color(0xff415EF6)),
    new DashboardItem(
        "My Approval", Icons.format_indent_decrease, Color(0xffEEFBFA), Color(0xff415EF6)),
    new DashboardItem(
        "Whereabouts", Icons.visibility, Color(0xffFFF3F3), Color(0xffFD706B)),
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetLeaveState();
  }
}

class DashboardItem {
  String title;
  IconData icon;
  Color boxColor;
  Color iconColor;
  DashboardItem(this.title, this.icon, this.boxColor, this.iconColor);
}

class _WidgetLeaveState extends State<WidgetLeave> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //icon
    var dashboardItems = <Widget>[];
    for (var i = 0; i < widget.dashboardItem.length; i++) {
      var d = widget.dashboardItem[i];
      dashboardItems.add(
        Container(
          child: Expanded(child : Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: d.boxColor,
                ),
                child: IconButton(
                  icon: Icon(
                    d.icon,
                    size: 20,
                  ),
                  color: d.iconColor,
                  onPressed: () {
                   // _getSelectedDashboardItem(i);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                  child:Text(d.title, style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,))
            ]
          ),
          ),
        )


      );
    }

    //title
    var dashboardItemsTitle = <Widget>[];
    for (var i = 0; i < widget.dashboardItem.length; i++) {
      var d = widget.dashboardItem[i];
      dashboardItemsTitle.add(
          Flexible(
            child: Text(d.title, overflow: TextOverflow.ellipsis,),
          )
      );
    }

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
          color: HexColor(COLOR_THEME_PRIMARY_BLUE)),
      child: Wrap(
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: dashboardItems),
//          Container(
//            width: MediaQuery.of(context).size.width,
//            margin: EdgeInsets.only(top: 10),
//            child:  Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: dashboardItemsTitle),
//          )

        ],
      ),
    );
  }

  _getSelectedDashboardItem(int pos){
    switch(pos){
      case 0:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
      case 1:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new OvertimeActivity()));
      case 2:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
      case 3:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
      default:
        return new Text("Error");
    }
  }
}