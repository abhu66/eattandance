
import 'package:eattandance/constants.dart';
import 'package:eattandance/widget/widget_checkin_checkout.dart';
import 'package:eattandance/widget/widget_dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget{

  HomeScreen({Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen>{
  Future<bool> _onBackPressed() {
    return null;
  }


  MediaQueryData queryData;


  @override
  Widget build(BuildContext context) {

    queryData = MediaQuery.of(context);
    // TODO: implement build
//    SystemChrome.setSystemUIOverlayStyle(
//      const SystemUiOverlayStyle(
//        statusBarColor: Color(COLOR_BRI_BLUE_2),
//        systemNavigationBarColor: Colors.black,
//        systemNavigationBarDividerColor: Colors.black,
//        systemNavigationBarIconBrightness: Brightness.light,
//      ),
//    );
    return  new WillPopScope(
      onWillPop: _onBackPressed,
      child:  Scaffold(
        backgroundColor: HexColor(COLOR_LIGHT_GREY),
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
                Icons.exit_to_app,
                color: Colors.white,
              ),
              tooltip: "Logout",
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(0),
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    ClipPath(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        height: 300,
                        decoration: BoxDecoration(
                         color: HexColor(COLOR_THEME_PRIMARY_BLUE),
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                              const EdgeInsets.fromLTRB(16, 5, 16, 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                    child: CircleAvatar(
                                    backgroundImage: NetworkImage("https://pixinvent.com/materialize-material-design-admin-template/app-assets/images/user/12.jpg"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  color: Colors.transparent,
                                  child: Text(
                                    "Welcome Back, Username",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Bold',
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // clipper: CurveShape(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 180),
                      child: WidgetCheckInOut(
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 360),
                      child: WidgetDashboard(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

