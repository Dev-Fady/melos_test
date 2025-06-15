import 'dart:convert';
import 'package:cache/cache_helper.dart';
import 'package:constants/app_constants.dart';
import 'package:home/data/local_data/home_local_data_source.dart';
import 'package:home/data/model/home_model.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  CacheHelper prefs = CacheHelper();
  @override
  Future<void> cacheHomeData({required HomeModel homeModel}) async {
    final jsonString = jsonEncode(homeModel.toJson());
    await prefs.saveData(key: AppConstants.cachedHomeKey, value: jsonString);
  }

  @override
  Future<void> clearCachedHomeData() async {
    await prefs.removeData(key: AppConstants.cachedHomeKey);
  }

  @override
  Future<HomeModel?> getCachedHomeData() async {
    final jsonString = await prefs.getData(key: AppConstants.cachedHomeKey);
    if (jsonString != null) {
      return HomeModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
