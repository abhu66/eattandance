import 'package:eattendance/activitys/attendance_activity.dart';
import 'package:eattendance/activitys/leave_activity.dart';
import 'package:eattendance/activitys/overtime_activity.dart';
import 'package:eattendance/bottom_menu.dart';
import 'package:eattendance/constants.dart';
import 'package:eattendance/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:eattendance/location_service.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title, this.tabIndex}) : super(key: key);
  final String title;
  final int tabIndex;

  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Attandance", Icons.event_available),
    new DrawerItem("Overtime", Icons.access_time),
    new DrawerItem("Leave", Icons.directions_run),
    new DrawerItem("Other", Icons.list),
    new DrawerItem("Profile", Icons.account_circle),
    new DrawerItem("About Application", Icons.help_outline),
    new DrawerItem("Log Out", Icons.exit_to_app),
  ];

  // final LoginRes user;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex;
  int _selectedDrawerIndex = 0;
  final GlobalKey _scaffoldKey = new GlobalKey();
  UserLocation _userLocation;

  @override
  void initState() {
    super.initState();
    _currentTabIndex = widget.tabIndex;
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var userLocation  = Provider.of<UserLocation>(context);
    setState(() {
      _userLocation = userLocation;
    });

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
          drawerOptions.add(
            Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                color: _selectedDrawerIndex == i
                    ? HexColor(COLOR_LIGHT_BLUE_EFFECT)
                    : Colors.transparent,
              ),
              child: new ListTile(
                leading: new Icon(d.icon),
                title: new Text(d.title),
                selected: i == _selectedDrawerIndex,
                onTap: () {
                  _onSelectItem(i);
                  _getDrawerItemWidget(_selectedDrawerIndex);
                },
              ),
            ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(COLOR_THEME_PRIMARY_BLUE),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 18.0),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // _widgetUtil.showAlertLogout(context, widget.user);
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            tooltip: "Logout",
          ),
        ],
      ),
      body: HomeScreen(),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://flutterowl.com/flutterowl.png")),
              title: Text("FlutterOWl"),
              subtitle: Text("flutterowl9@gmail.com"),
            ),
            Divider(),
            Column(children: drawerOptions),
            Container(
                // This align moves the children to the bottom
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    // This container holds all the children that will be aligned
                    // on the bottom and should not scroll with the above ListView
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings')),
                      ],
                    ),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeScreen();
      case 1:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity(userLocation: _userLocation,)));
      case 2:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new OvertimeActivity()));
      case 3:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new LeaveActivity()));
      case 4:
        return Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new AttendanceActivity()));
      default:
        return new Text("Error");
    }
  }
}
