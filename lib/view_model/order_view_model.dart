import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/order_repo.dart';
import 'package:porter/utils/utils.dart';
class OrderViewModel with ChangeNotifier {
  final _orderRepo = OrderRepository();
  bool _loading = false;
  bool get loading => _loading;

  int? _locationType;
  int? get locationType => _locationType;
   setLocationType(int value) {
    _locationType = value;
    notifyListeners();
  }

  dynamic _pickupData;
  dynamic _dropData;

  dynamic get pickupData => _pickupData;
  dynamic get dropData => _dropData;

   setLocationData(dynamic data) {
     print(data);
    if(_locationType==0){
      print("pickup");
      _pickupData = data;
    }else{
      print("drop");

      _dropData = data;
    }
    notifyListeners();
  }

  Future<void> orderApi(
      dynamic vehicle,
      dynamic pickupAddress,
      dynamic dropAddress,
      dynamic dropLatitude,
      dynamic dropLongitude,
      dynamic pickupLatitude,
      dynamic pickupLongitude,
      dynamic name,
      dynamic phone,
      BuildContext context,
      ) async {
    setLoading(true);
    Map<String, dynamic> data = {
      "userid": "1",
      "vehicle_type": vehicle,
      "pickup_address": pickupAddress,
      "drop_address": dropAddress,
      "drop_latitude": dropLatitude,
      "drop_longitude": dropLongitude,
      "pickup_latitude": pickupLatitude,
      "pickup_longitude": pickupLongitude,
      "name": name,
      "phone": phone,
    };

    try {
      final response = await _orderRepo.orderApi(data);
      setLoading(false);

      if (response.status == 200) {
        Utils.showSuccessMessage(context, "Order successfully placed!");
      } else {
        Utils.showErrorMessage(context, 'Failed to place order. Please try again.');
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

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
