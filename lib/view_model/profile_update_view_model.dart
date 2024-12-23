import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/profile_update_repo.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view_model/profile_view_model.dart';
import 'package:porter/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class ProfileUpdateViewModel with ChangeNotifier {
  final _profileUpdateRepo = ProfileUpdateRepository();
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> profileUpdateApi(
      dynamic firstname,
      dynamic lastname,
      dynamic email,
      dynamic mobileNumber,
      dynamic gstNumber,
      dynamic gstRegistration,
       context,
      ) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId= await userViewModel.getUser();
    Map data = {
      "id": userId,
      "first_name": firstname,
      "last_name": lastname,
      "email": email,
      "phone": mobileNumber,
      "gst_number": gstNumber,
      "gst_registration": gstRegistration,
    };
    try {
      final response = await _profileUpdateRepo.profileUpdateApi(data);
      setLoading(false);

      if (response.status == 200) {
        Provider.of<ProfileViewModel>(context, listen: false).profileApi();
        Utils.showSuccessMessage(context, "Profile updated successfully!");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update profile: ${response.message}')),
        );
      }
    } catch (error) {
      setLoading(false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $error')),
      );
      if (kDebugMode) {
        print('Error: $error');
      }
    }
  }
}
