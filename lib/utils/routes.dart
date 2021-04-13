
import 'package:flutter/material.dart';
import 'package:socialgram/onboarding/onboarding.dart';
import 'package:socialgram/splash/splashscreen.dart';
import 'package:socialgram/utils/route_name.dart';

import 'package:socialgram/view_screen/directmessage.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => AnimatedSplashScreen());
     case RouteName.DirectMessage:
        return MaterialPageRoute(builder: (_) => DirectMessage());
      case RouteName.Onboarding:
        return MaterialPageRoute(builder: (_) => InfoScreen());


      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
//                  Image.asset('assets/images/error.jpg'),
                  Text(
                    "${settings.name} does not exists!",
                    style: TextStyle(fontSize: 24.0),
                  )
                ],
              ),
            ),
          ),
        );
    }
  }
}