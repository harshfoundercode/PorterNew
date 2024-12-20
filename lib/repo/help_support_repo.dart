import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/help_and_support_model.dart';
import 'package:porter/res/api_url.dart';
class HelpSupportRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> helpSupportApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.helpSupportUrl);
      return HelpAndSupportModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during helpSupportApi: $e');
      }
      rethrow;
    }
  }
}
