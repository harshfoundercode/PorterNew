import 'package:flutter/material.dart';
import 'package:porter/main.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/res/services.dart';
import '../generated/assets.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  Services services=Services();
  @override
  void initState() {
    super.initState();
    services.checkAuthentication(context);
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
}

