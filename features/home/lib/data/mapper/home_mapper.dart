import 'package:extensions/constant/constant.dart';
import 'package:extensions/extensions.dart';
import 'package:home/data/model/home_model.dart';
import 'package:home/domain/entites/home_entity.dart';

extension HomeModelMapper on HomeModel? {
  HomeEntity toEntity() {
    return HomeEntity(
      id: this?.id.orEmpty() ?? Constant.empty,
      email: this?.email.orEmpty() ?? Constant.empty,
      password: this?.password.orEmpty() ?? Constant.empty,
      name: this?.name.orEmpty() ?? Constant.empty,
      role: this?.role.orEmpty() ?? Constant.empty,
      imageAvatar: this?.imageAvatar.orEmpty() ?? Constant.empty,
    );
  }
}
