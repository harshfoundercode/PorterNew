import 'dart:async';
import 'package:flutter/material.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/view/auth/login_page.dart';
import 'package:porter/view/bottom_nav_bar.dart';
import 'package:porter/view_model/user_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      checkSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: PortColor.blue,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PORTER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.location_on,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkSession() async {
    try {
      UserViewModel userViewModel = UserViewModel();
      String? userId = await userViewModel.getUser();

      if (userId != null && userId.isNotEmpty) {
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    } catch (e) {
      print("Error fetching user ID: $e");
    }
  }
}

