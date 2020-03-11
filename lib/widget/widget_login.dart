import 'package:eattendance/constants.dart';
import 'package:eattendance/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';


// ignore: must_be_immutable
class WidgetLogin extends StatefulWidget {
  WidgetLogin({Key key,}) : super(key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WidgetLoginState();
  }
}

class _WidgetLoginState extends State<WidgetLogin> {
  bool _isLoading     = false;
  String username;
  String password;
  final formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    SystemChrome.setSystemUIOverlayStyle(
//      const SystemUiOverlayStyle(
//        statusBarColor: HexColor(COLOR_LIGHT_GREY),
//        systemNavigationBarIconBrightness: Brightness.dark,
//      ),
//    );
//    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return new Scaffold(
      appBar: null,
      body: new Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleLogin(),
                  SizedBox(height: 80.0,),
                  _formLogin(),
                  _buildButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconLogin(){
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      child:Image.asset("assets/images/logo_gasi.jpg",
        width: 200.0,
        height: 200.0,),
    );
  }
  Widget _titleLogin(){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text("e-ATTANDANCE",
          style: TextStyle(color: Colors.black,fontSize: 16.0),)
      ],
    );
  }

  Widget _formLogin(){
    return Column(
      children: <Widget>[
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                onSaved: (val) => username = val,
                validator: (val) {
                  return val.length < 10
                      ? "Username or email is required."
                      : null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Username or Email',

                ),
              ),
              SizedBox(height: 20,),
              new TextFormField(
                onSaved: (val) => password = val,
                validator: (val) {
                  return val.length < 5
                      ? "Password is required."
                      : null;
                },
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: "Password",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext _ctx){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: new MainScreen(title: "Home",)));
          },
          child: Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            height: 50.0,
            width: double.infinity,
            child:
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: HexColor(COLOR_THEME_PRIMARY_BLUE),)),
              onPressed: () {
                Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rightToLeft, child: new MainScreen(title: "Home",)));
              },
              color: HexColor(COLOR_THEME_PRIMARY_BLUE),
              textColor: Colors.white,
              child: _isLoading ? _loadingIndicator() : Text("SIGNIN".toUpperCase(),
                  style: TextStyle(fontSize: 14)),
            ),
          ),
        )
      ],
    );
  }

  Widget _loadingIndicator() {
    return Container(
        width: 20.0,
        height: 20.0,
        child: (CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
          backgroundColor: Colors.yellow,
          value: 0.2,
        ))
    );
  }

}
