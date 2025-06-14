import 'dart:convert';

import 'package:cache/cache_helper.dart';
import 'package:constants/app_constants.dart';
import 'package:login/data/local_data/login_local_data_scurce.dart';
import 'package:login/data/model/login_model.dart';

class LoginLocalDataScurceImpl implements LoginLocalDataSource {
  CacheHelper prefs = CacheHelper();
  @override
  Future<void> cacheLoginData({required LoginModel loginModel}) async {
    final jsonString = jsonEncode(loginModel.toJson());
    await prefs.saveData(key: AppConstants.cachedLoginKey, value: jsonString);
  }

  @override
  Future<void> clearCachedLoginData() async {
    await prefs.clearData();
  }

  @override
  Future<LoginModel?> getCachedLoginData() async {
    final jsonString = prefs.getData(key: AppConstants.cachedLoginKey);
    if (jsonString != null) {
      return LoginModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
