import 'package:all_teams/data/model/all_team_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'all_teams_response_model.g.dart';

@JsonSerializable()
class AllTeamsResponseModel {
  final List<AllTeamModel> data;
  final Pagination pagination;

  AllTeamsResponseModel({required this.data, required this.pagination});

  factory AllTeamsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllTeamsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllTeamsResponseModelToJson(this);
}

@JsonSerializable()
class Pagination {
  final int count;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'next_page')
  final String? nextPage;
  @JsonKey(name: 'has_more')
  final bool hasMore;

  Pagination({
    required this.count,
    required this.perPage,
    required this.currentPage,
    this.nextPage,
    required this.hasMore,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
