import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/login_repo.dart';
import 'package:porter/view/auth/otp_page.dart';
import 'package:porter/view/auth/register_page.dart';
import 'package:porter/view/bottom_nav_bar.dart';
import 'package:porter/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final _loginRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic mobile,  context) async {
    setLoading(true);
    Map data = {
      "phone": mobile,
    };
    _loginRepo.loginApi(data).then((value) {
      if (value['status'] == 200) {
        UserViewModel userViewModel = UserViewModel();
        userViewModel.saveUser(value["data"]["id"].toString());
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(mobileNumber: mobile, userId: '',)));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage(mobileNumber: mobile)));
        setLoading(false);
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
  Future<void> sendOtpApi(dynamic mobile, context) async {
    setLoading(true);
    _loginRepo.sendOtpApi(mobile.toString()).then((value) {
      if (value['error'] == 200) {
        UserViewModel userViewModel = UserViewModel();
        userViewModel.saveUser(value["data"]["id"].toString());
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage(mobileNumber: mobile, userId: '',)));
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
  Future<void> verifyOtpApi(dynamic phone , dynamic otp,dynamic userId,context) async {
    setLoading(true);
    _loginRepo.verifyOtpApi(phone,otp).then((value) {
      if (value['error'].toString() == "200") {
        UserViewModel userViewModel = UserViewModel();
        userViewModel.saveUser(userId);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationPage()));
      }

    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}
