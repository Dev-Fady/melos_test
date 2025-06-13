import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "age")
  String? age;

  LoginModel({
    this.name,
    this.phone,
    this.age,
  });

  // from json
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
