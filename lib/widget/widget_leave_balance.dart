import 'package:eattendance/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetLeaveBalance extends StatefulWidget {

  final leaveBalance = [
    new LeaveBalance("Core Leave Balance", "10 Days"),
    new LeaveBalance("Annual Leave Balance", "5 Days"),
    new LeaveBalance("Bonus Leave Balance", "0 Days"),
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetLeaveBalanceState();
  }
}

class _WidgetLeaveBalanceState extends State<WidgetLeaveBalance> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                labelStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                labelText: "Leave Balance",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            padding: const EdgeInsets.only(left :15.0,right :15.0),
            child: _myListView(context),
          ),
         Container(
              margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.only(left: 18, right: 18),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                labelStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                labelText: "Subordinate Data",
                suffixIcon: Icon(Icons.arrow_forward)
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _myListView(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.leaveBalance.length,
      itemBuilder: (context, index) {
        return Container(
          color: HexColor(COLOR_LIGHT_BLUE_EFFECT),
          margin: EdgeInsets.only(top: 1),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                //key
                  Expanded(
                  child: Column(
                    // align the text to the left instead of centered
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.leaveBalance[index].title, style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                Text(": "),
                //value day
                Expanded(
                  child: Column(
                    // align the text to the left instead of centered
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.leaveBalance[index].days, style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class LeaveBalance {
  String title;
  String days;
  LeaveBalance(this.title, this.days);
}


