import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/res/api_url.dart';
class OrderRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> orderApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.orderUrl, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during orderApi: $e');
      }
      rethrow;
    }
  }
}