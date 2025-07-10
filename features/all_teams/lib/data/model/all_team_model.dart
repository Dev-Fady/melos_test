import 'package:json_annotation/json_annotation.dart';
part 'all_team_model.g.dart';

@JsonSerializable()
class AllTeamModel {
  String? name;
  @JsonKey(name: "image_path")
  String? imagePath;
  int? founded;
  @JsonKey(name: "last_played_at")
  DateTime? lastPlayed;

  AllTeamModel({this.name, this.imagePath, this.founded, this.lastPlayed});

  factory AllTeamModel.fromJson(Map<String, dynamic> json) =>
      _$AllTeamModelFromJson(json);

  Map<String, dynamic> toJson() => _$AllTeamModelToJson(this);
}
