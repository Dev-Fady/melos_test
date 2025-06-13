import 'package:extensions/constant/constant.dart';
import 'package:extensions/extensions.dart';
import 'package:login/data/model/login_model.dart';
import 'package:login/domain/entites/login_entity.dart';


extension LoginModelMapper on LoginModel? {
  LoginEntity toEntity() {
    return LoginEntity(
      name: this?.name.orEmpty() ?? Constant.empty,
      phone: this?.phone.orEmpty() ?? Constant.empty,
      age: this?.age.orEmpty() ?? Constant.empty,
    );
  }
}
