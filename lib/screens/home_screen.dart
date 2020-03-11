
import 'package:eattandance/constants.dart';
import 'package:eattandance/widget/widget_checkin_checkout.dart';
import 'package:eattandance/widget/widget_dashboard.dart';
import 'package:eattandance/widget/widget_upcoming_event.dart';
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
                              const EdgeInsets.fromLTRB(16, 20, 16, 16),
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
                              CrossAxisAlignment.center,
                              children: <Widget>[
                                    new Container(
                                      child:Center(child :Text(
                                        "Welcome Back, Username",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Bold',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      ),
                                      width: 300.0,
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
                    Padding(
                      padding: EdgeInsets.only(top: 480,right: 18,bottom:
                      20),
                      child: WidgetUpComingEvent(),
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

