import 'dart:convert';

import 'package:all_teams/data/local_data/all_teams_loacl_data_source.dart';
import 'package:all_teams/data/model/all_teams_response_model.dart';
import 'package:cache/cache_helper.dart';
import 'package:constants/app_constants.dart';

class AllTeamsLoaclDataSourceImpl implements AllTeamsLoaclDataSource {
  CacheHelper prefs = CacheHelper();
  @override
  Future<void> cacheAllTeamsData({
    required AllTeamsResponseModel allTeamsResponseModel,
  }) async {
    final jsonString = jsonEncode(allTeamsResponseModel.toJson());
    await prefs.saveData(
      key: AppConstants.cachedAllTeamsKey,
      value: jsonString,
    );
  }

  @override
  Future<void> clearCachedAllTeamsData() async {
    await prefs.clearData();
  }

  @override
  Future<AllTeamsResponseModel?> getCachedAllTeamsData() async {
    final jsonString = prefs.getData(key: AppConstants.cachedAllTeamsKey);
    if (jsonString != null) {
      return AllTeamsResponseModel.fromJson(jsonDecode(jsonString));
    }
    return null;
  }
}
