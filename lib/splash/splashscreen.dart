import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socialgram/utils/route_name.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(RouteName.Onboarding);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom:5.0),child:Text('powered by :',style: TextStyle(fontFamily: 'GilroyLight',fontWeight: FontWeight.w600,color: Colors.black,fontSize: 12),)),
              Padding(padding: EdgeInsets.only(bottom: 30.0),child:Text('F L U T T E R D E V S',style: TextStyle(fontFamily: 'GilroyLight',color: Colors.grey[600],fontWeight: FontWeight.w400,fontSize: 24)))
            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/launcher/icon.png',scale: 2,
                width: animation.value * 200,
                height: animation.value * 200,
              ),
              Text('Socialgram',textScaleFactor: 2.25,style: TextStyle(fontFamily: 'GilroyLight'),)
            ],
          ),
        ],
      ),
    );
  }
}