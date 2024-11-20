import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/register_repo.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view/auth/otp_page.dart';
import 'package:porter/view/bottom_nav_bar.dart';
import 'package:porter/view_model/user_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  final _registerRepo = RegisterRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> registerApi(dynamic firstname, dynamic lastname, dynamic email,
      dynamic mobileNumber, String value, context) async {
    setLoading(true);

    Map data = {
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "type": value,
      "phone": mobileNumber,
    };
    // UserViewModel userViewModel = UserViewModel();
    // userViewModel.saveUser(value["data"]["id"].toString());
    print(data);
    _registerRepo.registerApi(data).then((value) async {
      setLoading(false);
      if (value['status'] == 200) {
        print(value);
        Utils.show(context, value["message"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  OtpPage(mobileNumber: mobileNumber, userId:value["data"]["id"].toString())));
      } else {
        Utils.show(context, value["message"]);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text(value['message'] ?? 'Registration failed')),
        // );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
    });
  }
}
