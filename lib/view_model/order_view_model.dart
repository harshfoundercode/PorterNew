import 'dart:convert';

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
     print("ddddd $data");
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
      dynamic senderName,
      dynamic senderPhone,
      dynamic recieverName,
      dynamic recieverPhone,
      BuildContext context,
      ) async {
    setLoading(true);
    Map data = {
      "userid": "1",
      "vehicle_type": vehicle,
      "pickup_address": pickupAddress.toString(),
      "drop_address": dropAddress.toString(),
      "drop_latitute": dropLatitude.toString(),
      "drop_logitute": dropLongitude.toString(),
      "pickup_latitute": pickupLatitude.toString(),
      "pickup_logitute": pickupLongitude.toString(),
      "sender_name":senderName,
      "sender_phone":senderPhone,
      "reciver_name":recieverName,
      "reciver_phone":recieverPhone,
    };
print(jsonEncode(data));
print("qwer");
    try {
      final response = await _orderRepo.orderApi(data);
      setLoading(false);

      if (response["status"] == 200) {
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
