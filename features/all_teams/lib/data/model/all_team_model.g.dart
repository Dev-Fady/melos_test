// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTeamModel _$AllTeamModelFromJson(Map<String, dynamic> json) => AllTeamModel(
      name: json['name'] as String?,
      imagePath: json['image_path'] as String?,
      founded: (json['founded'] as num?)?.toInt(),
      lastPlayed: json['last_played_at'] == null
          ? null
          : DateTime.parse(json['last_played_at'] as String),
    );

Map<String, dynamic> _$AllTeamModelToJson(AllTeamModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_path': instance.imagePath,
      'founded': instance.founded,
      'last_played_at': instance.lastPlayed?.toIso8601String(),
    };
