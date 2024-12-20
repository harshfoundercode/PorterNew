import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/add_address_repo.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view_model/user_view_model.dart';

class AddAddressViewModel with ChangeNotifier {
  final _addAddressRepo = AddAddressRepo();
  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> addAddressApi({
    required dynamic latitude,
    required dynamic longitude,
    required dynamic address,
    required dynamic phone,
    required dynamic addressType,
    required dynamic name,
    required dynamic pinCode,
    required dynamic house,
    required BuildContext context,
  }) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map<String, dynamic> data = {
      "userid": userId,
      "latitude": latitude,
      "longitude": longitude,
      "address": address,
      "contact_no": phone,
      "address_type": addressType,
      "name": name,
      "pincode": pinCode,
      "house": house,
    };

    print(data);

    try {

      print(userId);
      final response = await _addAddressRepo.addAddressApi(data);
      setLoading(false);

      if (response.status == 200) {
        print("Address added successfully: ${response.message}");
         Utils.showSuccessMessage(context, "Address added successfully!");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add address: ${response.message}')),
        );
      }
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print('Error: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
