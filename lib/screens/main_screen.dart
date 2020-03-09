import 'package:eattandance/bottom_menu.dart';
import 'package:eattandance/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title,this.tabIndex}) : super(key: key);
  final String title;
  final int tabIndex;
 // final LoginRes user;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex;
  int _selectedDrawerIndex = 0;


  @override
  void initState(){
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
    //var userLocation  = Provider.of<UserLocation>(context);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );


    return Scaffold(
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(backgroundImage:  NetworkImage("https://flutterowl.com/flutterowl.png")),
                title: Text("FlutterOWl"),
                subtitle: Text("flutterowl9@gmail.com"),
              ),
              ListTile(leading: Icon(Icons.home), title: Text("Home")),
              ListTile(leading: Icon(Icons.event_available), title: Text("Attandance")),
              ListTile(leading: Icon(Icons.access_time), title: Text("Overtime")),
              ListTile(leading: Icon(Icons.directions_walk), title: Text("Leave")),
              ListTile(leading: Icon(Icons.list), title: Text("Other")),
              ListTile(leading: Icon(Icons.account_circle), title: Text("Profile")),
              ListTile(leading: Icon(Icons.help_outline), title: Text("About Application")),
              ListTile(leading: Icon(Icons.exit_to_app), title: Text("Log Out")),
            ],
          )),
//        bottomNavigationBar: BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          backgroundColor: Colors.white,
//          selectedItemColor: Colors.black,
//          currentIndex: _currentTabIndex,
//          onTap: (int index) {
//            setState(() {
//                setState(() {
//                  _currentTabIndex = index;
//                });
//            });
//          },
//          items: [
//            BottomNavigationBarItem(
//              title: Text("Home"),
//              icon: ImageIcon(AssetImage("assets/images/089_home.png")),
//            ),
//            BottomNavigationBarItem(
//              title: Text("Attandance"),
//              icon: ImageIcon(AssetImage("assets/images/021_calendar.png")),
//            ),
//            BottomNavigationBarItem(
//              title: Text("Overtime"),
//              icon: ImageIcon(AssetImage("assets/images/list_1.png")),
//            ),
//            BottomNavigationBarItem(
//              title: Text("Leave"),
//              icon: ImageIcon(AssetImage("assets/images/user.png")),
//            ),
//            BottomNavigationBarItem(
//              title: Text("Other"),
//              icon: ImageIcon(AssetImage("assets/images/user.png")),
//            ),
//          ],
////        items: allDestinations.map((Destination destination){
////          return BottomNavigationBarItem(
////            icon: destination.icon,
////            backgroundColor: destination.color,
////            title: Text(FMSLocalization.of(context).),
////          );
////        }).toList(),
//        ),
    );
  }


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomeScreen();
      case 1:
        return new HomeScreen();
      case 2:
        return new HomeScreen();

      default:
        return new Text("Error");
    }
  }
}
