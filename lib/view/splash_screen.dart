import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/view_model/user_view_model.dart';

import '../generated/assets.dart';

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
      checkSession(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: PortColor.blue,
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: screenHeight * 0.23,
                width: screenWidth * 0.65,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.assetsCourierLogo),
                      fit: BoxFit.fill),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> checkSession(context) async {
    try {
      UserViewModel userViewModel = UserViewModel();
      String? userId = await userViewModel.getUser();

      if (userId != null && userId.isNotEmpty) {
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
      } else {
        Navigator.pushReplacementNamed(context, RoutesName.login);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching user ID: $e");
      }
    }
  }
}

