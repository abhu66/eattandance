import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDashboard extends StatefulWidget {
  final dashboardItem = [
    new DashboardItem("Attandance", Icons.event_available, Color(0xffF3F3FE),
        Color(0xff415EF6)),
    new DashboardItem(
        "Overtime", Icons.access_time, Color(0xffEEFBFA), Color(0xff415EF6)),
    new DashboardItem(
        "Leave", Icons.directions_run, Color(0xffFFF3F3), Color(0xffFD706B)),
    new DashboardItem(
        "Other", Icons.list, Color(0xffFFF3F3), Color(0xffFD706B)),
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetDashboardState();
  }
}

class DashboardItem {
  String title;
  IconData icon;
  Color boxColor;
  Color iconColor;
  DashboardItem(this.title, this.icon, this.boxColor, this.iconColor);
}

class _WidgetDashboardState extends State<WidgetDashboard> {
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
                  onPressed: () {},
                ),
              ),
              Container(
                  child:Text(d.title, overflow: TextOverflow.ellipsis,))
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
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
}