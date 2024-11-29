import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/address_delete_repo.dart';
import 'package:porter/utils/utils.dart';
import 'package:porter/view_model/user_view_model.dart';

class AddressDeleteViewModel with ChangeNotifier {
  final AddressDeleteRepo _addressDeleteRepo = AddressDeleteRepo();
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> deleteAddressApi({
    required String userid,
    required String addressId,
    required BuildContext context,
  }) async {
    setLoading(true);

    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    Map<String, dynamic> data = {
      "userid": userId,
      "address_id": addressId,
    };

    if (kDebugMode) {
      print("Request Data: $data");
    }

    try {
      final response = await _addressDeleteRepo.addressDeleteApi(data);
      setLoading(false);

      if (response.status == true) {
        if (kDebugMode) {
          print("Address deleted successfully: ${response.message}");
        }
        Utils.showSuccessMessage(context, "Address deleted successfully!");
      } else {
        if (kDebugMode) {
          print("Failed to delete address: ${response.message}");
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete address: ${response.message}')),
        );
      }
    } catch (e) {
      setLoading(false);
      if (kDebugMode) {
        print('Error occurred during address deletion: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
