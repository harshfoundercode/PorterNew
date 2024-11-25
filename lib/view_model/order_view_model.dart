import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:porter/repo/order_repo.dart';
import 'package:porter/utils/utils.dart';
class OrderViewModel with ChangeNotifier {
final fromLocation = TextEditingController();
final toLocation = TextEditingController();
final  recieverName = TextEditingController();
final recieverNumber= TextEditingController();

dynamic fromLat;
dynamic fromLog;
dynamic toLat ;
dynamic toLog ;
  final  _orderRepo = OrderRepository();
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
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
      dynamic amount,
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
      "amount": amount,
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
}
