import 'package:flutter/material.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/view/auth/login_page.dart';
import 'package:porter/view/auth/otp_page.dart';
import 'package:porter/view/auth/register_page.dart';
import 'package:porter/view/bottom_nav_bar.dart';
import 'package:porter/view/splash_screen.dart';
class Routers {
   static WidgetBuilder generateRoute(String routeName) {
      switch (routeName) {
         case RoutesName.splash:
            return (context) => const SplashScreen();
         case RoutesName.login:
            return (context) => const LoginPage();
         case RoutesName.bottomNavBar:
            return (context) => const BottomNavigationPage();
         case RoutesName.otp:
            return (context) => const OtpPage();
         case RoutesName.register:
            return (context) => const RegisterPage();


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