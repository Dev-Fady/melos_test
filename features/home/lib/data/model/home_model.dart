import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "avatar")
  String? imageAvatar;

  HomeModel({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.imageAvatar,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
