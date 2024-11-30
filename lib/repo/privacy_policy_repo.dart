import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/privacy_policy_model.dart';
import 'package:porter/res/api_url.dart';
class PrivacyPolicyRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PrivacyPolicyModel> privacyPolicyApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.privacyPolicyUrl);
      return PrivacyPolicyModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during privacyPolicyApi: $e');
      }
      rethrow;
    }
  }
}