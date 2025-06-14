import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "access_token")
  String? accessToken;

  @JsonKey(name: "refresh_token")
  String? refreshToken;

  LoginModel({
    this.accessToken,
    this.refreshToken,
  });

  // from json
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
