// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_teams_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTeamsResponseModel _$AllTeamsResponseModelFromJson(
  Map<String, dynamic> json,
) => AllTeamsResponseModel(
  data: (json['data'] as List<dynamic>)
      .map((e) => AllTeamModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AllTeamsResponseModelToJson(
  AllTeamsResponseModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'pagination': instance.pagination,
};

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  count: (json['count'] as num).toInt(),
  perPage: (json['per_page'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
  nextPage: json['next_page'] as String?,
  hasMore: json['has_more'] as bool,
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'next_page': instance.nextPage,
      'has_more': instance.hasMore,
    };
