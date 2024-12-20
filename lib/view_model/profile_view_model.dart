import 'package:flutter/foundation.dart';
import 'package:porter/model/profile_model.dart';
import 'package:porter/repo/profile_repo.dart';
import 'package:porter/view_model/user_view_model.dart';
class ProfileViewModel with ChangeNotifier {
  final _profileRepo = ProfileRepo();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ProfileModel? _profileModel;
  ProfileModel? get profileModel => _profileModel;

  setModelData(ProfileModel value) {
    _profileModel = value;
    notifyListeners();
  }
  Future<void> profileApi() async {
    setLoading(true);
      UserViewModel userViewModel = UserViewModel();
      String? userId = await userViewModel.getUser();
       _profileRepo.profileApi(userId).then((value){
         print('value:$value');
         if (value.status == 200) {
           setModelData(value);
         }
       }).onError((error, stackTrace) {
         setLoading(false);
         if (kDebugMode) {
           print('error: $error');
         }
       });
  }
}

