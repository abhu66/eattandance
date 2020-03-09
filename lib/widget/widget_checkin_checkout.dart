import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCheckInOut extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetCheckInOutState();
  }
}

class _WidgetCheckInOutState extends State<WidgetCheckInOut> {
  bool _isLoading = false;
  bool _isCheckIn = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 170,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(
                _isCheckIn == true ? "Check Out" : "Check In",
                style: TextStyle(
                  color: Color(0xff64676F),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Regular',
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                _isCheckIn == true ? "Don't forget to check out" : "You haven't Check In yet.",
                style: TextStyle(
                  color: Color(0xff64676F),
                  fontFamily: 'Regular',
                  fontSize: 16,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.play_circle_outline,color: Colors.red,size: 70.0,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
