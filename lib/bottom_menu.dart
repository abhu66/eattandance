

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final ImageIcon icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Main', ImageIcon(AssetImage("assets/images/089_home.png")), Colors.grey),
  Destination('Booking', ImageIcon(AssetImage("assets/images/021_calendar.png")), Colors.grey),
  Destination('Trip',ImageIcon(AssetImage("")), Colors.grey),
  Destination('Approval',ImageIcon(AssetImage("assets/images/list_1.png")), Colors.grey),
  Destination('Account', ImageIcon(AssetImage("assets/images/user.png")), Colors.grey)
];
//List<Widget> destinationTab = <Widget>[
//  HomeScreen(),
//  BookingScreen(),
//  null,
//  ApprovalScreen(title: "Trip Approval",),
//  MainScreen(title: "Mobility",tabIndex: 0,),
//];