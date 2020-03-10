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
      child :Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Text(
                  _isCheckIn == true ? "Check Out" : "Check In",
                  style: TextStyle(
                      color: Color(0xff64676F),
                      fontFamily: 'Regular',
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child:  Container(
              width: 200.0,
              child:Row(
                children: <Widget>[
                  Flexible(child : Text(
                      _isCheckIn == true ? "Don't forget to check out." : "You havn't check in yet.",
                      style: TextStyle(
                        color: Color(0xff64676F),
                        fontFamily: 'Regular',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Positioned(
              right: -10.0,
              top: -10.0,
              child:InkWell(
                  onTap: (){
                    setState(() {
                      _isCheckIn == true ? _isCheckIn =false : _isCheckIn = true;
                    });
                  },
                  child: new Icon(Icons.play_circle_outline,color: _isCheckIn == true ? Colors.red : Colors.yellow,size: 120.0,)
              )
          ),
          Positioned(
            left: 0.0,
            bottom: 10.0,
            child:  Container(
              width: 200.0,
              child: Row(
              children: <Widget>[
                Flexible(
                  child: Text(
                    _isCheckIn == true ? "Have a good day!" : "",
                    style: TextStyle(
                      color: Color(0xff64676F),
                      fontFamily: 'Regular',
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
