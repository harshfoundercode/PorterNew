import 'package:flutter/material.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/view/splash_screen.dart';

class Routers {
   static WidgetBuilder generateRoute(String routeName) {
      switch (routeName) {
         case RoutesName.splash:
            return (context) => const SplashScreen();
         default:
            return (context) => const Scaffold(
               body: Center(
                  child: Text(
                     'No Route Found!',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.w600,
                         color: Colors.black),
                  ),
               ),
            );
      }
   }
}