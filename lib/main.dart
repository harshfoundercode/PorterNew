import 'package:flutter/material.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/utils/routes/routes_name.dart';
import 'package:porter/view/splash_screen.dart';
import 'package:porter/view_model/login_view_model.dart';
import 'package:porter/view_model/order_view_model.dart';
import 'package:porter/view_model/profile_update_view_model.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:porter/view_model/register_view_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

double screenHeight = 0.0;
double screenWidth = 0.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> RegisterViewModel()),
        ChangeNotifierProvider(create: (context)=> ProfileViewModel()),
        ChangeNotifierProvider(create: (context)=> AuthViewModel()),
        ChangeNotifierProvider(create: (context)=> ProfileUpdateViewModel()),
        ChangeNotifierProvider(create: (context)=> OrderViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splash,
        onGenerateRoute: (settings){
          if (settings.name !=null){
            return MaterialPageRoute(builder: Routers.generateRoute(settings.name!),
            settings: settings,
            );
          }
          return null;
        },
        title: 'Porter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
       // home: const SplashScreen(),
      ),
    );
  }
}