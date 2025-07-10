import 'package:all_teams/data/model/all_teams_response_model.dart';

abstract class AllTeamsLoaclDataSource {
  Future<void> cacheAllTeamsData({
    required AllTeamsResponseModel allTeamsResponseModel,
  });
  Future<AllTeamsResponseModel?> getCachedAllTeamsData();
  Future<void> clearCachedAllTeamsData();
}
