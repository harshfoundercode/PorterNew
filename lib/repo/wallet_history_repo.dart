import 'package:flutter/foundation.dart';
import 'package:porter/helper/helper/network/base_api_services.dart';
import 'package:porter/helper/helper/network/network_api_services.dart';
import 'package:porter/model/wallet_history_model.dart';
import 'package:porter/res/api_url.dart';
class WalletHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WalletHistoryModel> walletHistoryApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.walletHistoryUrl+ data);
      return WalletHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during WalletHistoryApi: $e');
      }
      rethrow;
    }
  }
}