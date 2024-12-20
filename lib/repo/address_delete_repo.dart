import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/address_delete_model.dart';
import 'package:porter/res/api_url.dart';
class AddressDeleteRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> addressDeleteApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addressDeleteUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during addressDeleteApi: $e');
      }
      rethrow;
    }
  }
}
