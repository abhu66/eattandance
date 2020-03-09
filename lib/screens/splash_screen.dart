

import 'dart:async';

import 'package:eattandance/constants.dart';
import 'package:eattandance/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget{

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  AnimationController _animationController;


  @override
  void initState(){

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    startSplashScreen();
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
//    var db = new DatabaseHelper();
//    User user = await db.getUser();
//    String path = user == null ? "/login" : "/home";
//    return Timer(duration, (){
//      Navigator.of(context).pushReplacement(
//          new MaterialPageRoute(
//              settings: RouteSettings(name: '$path'),
//              builder: (context) => user == null ? new LoginScreen() : new HomeScreen(user: user,)
//          )
//      );
//    });
    return Timer(duration, (){
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
              settings: RouteSettings(name: 'main'),
              builder: (context) =>  new LoginScreen()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    SystemChrome.setSystemUIOverlayStyle(
//      const SystemUiOverlayStyle(
//        statusBarColor: Color(COLOR_BRI_BLUE_2),
//        systemNavigationBarColor: Colors.transparent,
//        systemNavigationBarDividerColor: Colors.black,
//        systemNavigationBarIconBrightness: Brightness.light,
//      ),
//    );
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children : <Widget>[
            Expanded(
              child: Center(
                child : Image.asset("assets/images/logo_gasi.jpg",
          width: 200.0,
          height: 200.0,),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 14.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Version "+TEXT_VERSION,style: TextStyle(color: HexColor(COLOR_TEXT_VERSION),fontSize: 12.0),textAlign: TextAlign.right,),
              ),
            )

          ],
        ),
      ),
    );
  }
}
