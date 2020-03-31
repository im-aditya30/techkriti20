import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:flutter_ui_splash_screen/homeScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
  Navigator.of(context).pushReplacementNamed('/HomeScreen');
}
@override
void initState() {
  super.initState();
  startTime();
  // setState(() {
  //   dataOfEvent = buildCompetitions();
  // });
}
  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    backgroundColor: Colors.white,
    body: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/background/loader.gif'),
        // CircularProgressIndicator(),
      ]
     
    ),
  );
  }
}