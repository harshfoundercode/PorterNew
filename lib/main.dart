import 'package:flutter/material.dart';
import 'package:porter/utils/routes/routes.dart';
import 'package:porter/utils/routes/routes_name.dart';
import 'package:porter/view_model/add_address_view_model.dart';
import 'package:porter/view_model/address_delete_view_model.dart';
import 'package:porter/view_model/address_show_view_model.dart';
import 'package:porter/view_model/help_and_support_view_model.dart';
import 'package:porter/view_model/login_view_model.dart';
import 'package:porter/view_model/order_view_model.dart';
import 'package:porter/view_model/privacy_policy_view_model.dart';
import 'package:porter/view_model/profile_update_view_model.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:porter/view_model/register_view_model.dart';
import 'package:porter/view_model/select_vehicles_view_model.dart';
import 'package:porter/view_model/service_type_view_model.dart';
import 'package:porter/view_model/terms_and_condition_view_model.dart';
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
        ChangeNotifierProvider(create: (context)=> SelectVehiclesViewModel()),
        ChangeNotifierProvider(create: (context)=> ServiceTypeViewModel()),
        ChangeNotifierProvider(create: (context)=> AddAddressViewModel()),
        ChangeNotifierProvider(create: (context)=> AddressShowViewModel()),
        ChangeNotifierProvider(create: (context)=> AddressDeleteViewModel()),
        ChangeNotifierProvider(create: (context)=> TermAndConditionViewModel()),
        ChangeNotifierProvider(create: (context)=> PrivacyPolicyViewModel()),
        ChangeNotifierProvider(create: (context)=> HelpAndSupportViewModel()),
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