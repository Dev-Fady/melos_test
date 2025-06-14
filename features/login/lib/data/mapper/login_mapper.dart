import 'package:extensions/constant/constant.dart';
import 'package:extensions/extensions.dart';
import 'package:login/data/model/login_model.dart';
import 'package:login/domain/entites/login_entity.dart';


extension LoginModelMapper on LoginModel? {
  LoginEntity toEntity() {
    return LoginEntity(
      accessToken: this?.accessToken.orEmpty() ?? Constant.empty,
      refreshToken: this?.refreshToken.orEmpty() ?? Constant.empty,
    );
  }
}
