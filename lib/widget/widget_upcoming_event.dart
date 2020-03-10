import 'package:eattandance/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

class WidgetUpComingEvent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetUpComingEventState();
  }
}

class _WidgetUpComingEventState extends State<WidgetUpComingEvent> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Upcoming Event",
              style: TextStyle(
                fontSize: 16,
                color: HexColor("#00172b"),
                fontFamily: FontFamilys.typeFacePopinsSemiBolds,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Container(
            height: 25,
            width: 1,
            margin: EdgeInsets.fromLTRB(16, 40, 5, 10),
            color: HexColor("#bcbec0"),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(12, 65, 5, 16),
              child: Row(
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      shadowColor: HexColor("#0068ce"),
                      color: HexColor("#0068ce"), // button color
                      child: InkWell(
                        splashColor: Colors.grey, // inkwell color
                        child: SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                ],
              )),
             Padding(
               padding: EdgeInsets.only(top: 45,left: 10),
               child: ListTile(
                 title: Text(
                   "Monday",
                   style: TextStyle(fontSize: 11.0, color: HexColor("#3f000000")),
                 ),
                 subtitle: Text(
                   "12 March 2020",
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(fontSize: 14.0, color: HexColor("#0068ce")),
                 ),
               ),
             ),
          Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(left: 120,top: 60),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: HexColor("#66e0e0e0"),
                  spreadRadius: 10,
                  blurRadius: 24,
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    0.0, // vertical, move down 10
                  ),// changes position of shadow
                ),

              ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Material(
                        color: Colors.transparent,
                        child: Text(
                          'Info Event',
                          style: TextStyle(
                              color: Color(COLOR_BRI_LOGIN_BLUE),
                              fontFamily: FontFamilys.typeFacePopinsSemiBolds,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Material(
                            color: Colors.transparent,
                            child:Text(
                              'Description',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: HexColor("#555555"),
                                  fontFamily:
                                  FontFamilys.typeFacePopinsSemiBolds,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child : Align(alignment: Alignment.bottomLeft,
                      child: ListTile(
                        title: Text(
                          "Created Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "1 Mar 2020",
                        ),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: ClipOval(
                            child: Material(
                              shadowColor: HexColor("#280068ce"),
                              color: Colors.blue, // button color
                              child: InkWell(
                                splashColor: Colors.grey, // inkwell color
                                child: SizedBox(
                                    width: 28,
                                    height: 28,
                                    child: Icon(Icons.arrow_forward_ios,size: 11,color: Colors.white,)),
                                onTap: () {
                                  print("Hai");
                                }
                              ),
                            ),
                          ),
                        ),
                        contentPadding: EdgeInsets.fromLTRB(5, 16, 12, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
