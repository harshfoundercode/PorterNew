import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/select_vehicles_model.dart';
import 'package:porter/res/api_url.dart';
class SelectVehiclesRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<SelectVehiclesModel> selectVehiclesApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.selectVehiclesUrl);
      return SelectVehiclesModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during loginApi: $e');
      }
      rethrow;
    }
  }
}