import 'package:flutter/foundation.dart';
import 'package:porter/model/service_type_model.dart';
import 'package:porter/repo/service_type_repo.dart';

class ServiceTypeViewModel with ChangeNotifier {
  final _serviceTypeRepo = ServiceTypeRepo();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ServiceTypeModel? _serviceTypeModel;
  ServiceTypeModel? get serviceTypeModel =>_serviceTypeModel;

  setModelData(ServiceTypeModel value) {
    _serviceTypeModel = value;
    notifyListeners();
  }
  Future<void> serviceTypeApi() async {
    setLoading(true);
    try {
      final response = await _serviceTypeRepo.serviceTypeApi();
      if (response.status == 200) {
        setModelData(response);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in profileApi: $e');
      }
    } finally {
      setLoading(false);
    }
  }
}

