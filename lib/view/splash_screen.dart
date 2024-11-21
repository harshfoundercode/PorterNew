import 'dart:async';
import 'package:flutter/material.dart';
import 'package:porter/res/constant_color.dart';
import 'package:porter/view/auth/login_page.dart';

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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
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
}
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:porter/res/constant_color.dart';
// import 'package:porter/view/auth/login_page.dart';
//
// import 'bottom_nav_bar.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   String? userId;
//
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       userId = null;
//
//       Timer(const Duration(seconds: 3), () {
//         if (userId == null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => const LoginPage()),
//           );
//         } else {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const BottomNavigationPage(),
//             ),
//           );
//         }
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       backgroundColor: PortColor.blue,
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'PORTER',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 40,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(width: 5),
//             Icon(
//               Icons.location_on,
//               color: Colors.white,
//               size: 30,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }