import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/add_address_model.dart';
import 'package:porter/res/api_url.dart';
class AddAddressRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<AddAddressModel> addAddressApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addAddressUrl, data);
      return AddAddressModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during loginApi: $e');
      }
      rethrow;
    }
  }
}
