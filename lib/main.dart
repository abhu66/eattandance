import 'package:eattendance/constants.dart';
import 'package:eattendance/location_service.dart';
import 'package:eattendance/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    // Fixing App Orientation.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return StreamProvider<UserLocation>(
        builder: (context) => LocationService().locationStream,
            child : new MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'e-ATTANDANCE',
              theme: new ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen(),
            ),
    );
  }
}
