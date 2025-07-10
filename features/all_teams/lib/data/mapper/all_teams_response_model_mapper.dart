import 'package:all_teams/data/mapper/all_teams_model_mapper.dart';
import 'package:all_teams/data/model/all_teams_response_model.dart';
import 'package:all_teams/domian/entites/all_teams_response_entity.dart';

extension AllTeamsResponseModelMapper on AllTeamsResponseModel {
  AllTeamsResponseEntity toEntity() {
    return AllTeamsResponseEntity(
      teams: data.map((teamModel) => teamModel.toEntity()).toList(),
      currentPage: pagination.currentPage,
      hasMore: pagination.hasMore,
    );
  }
}
