import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/terms_and_condition_model.dart';
import 'package:porter/res/api_url.dart';
class TermsAndConditionRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TermsAndConditionModel> termAndConditionApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.termAndConditionUrl);
      return TermsAndConditionModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during termConditionApi: $e');
      }
      rethrow;
    }
  }
}