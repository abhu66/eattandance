import 'package:eattandance/bottom_menu.dart';
import 'package:eattandance/constants.dart';
import 'package:eattandance/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title,this.tabIndex}) : super(key: key);
  final String title;
  final int tabIndex;


  final drawerItems = [
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

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  HexColor(COLOR_THEME_PRIMARY_BLUE),
        title: Text("Home",style: TextStyle(fontSize: 18.0),),
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
      body: _getDrawerItemWidget(_selectedDrawerIndex),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(backgroundImage:  NetworkImage("https://flutterowl.com/flutterowl.png")),
                title: Text("FlutterOWl"),
                subtitle: Text("flutterowl9@gmail.com"),
              ),
              Divider(),
              new Column(children: drawerOptions),
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
                              SizedBox(height: 20,),
                              ListTile(
                                  leading: Icon(Icons.settings),
                                  title: Text('Settings')),
                            ],
                          )
                      )
                  )
              )
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
