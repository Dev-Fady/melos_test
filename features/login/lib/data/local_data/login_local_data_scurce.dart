import 'package:login/data/model/login_model.dart';

abstract class LoginLocalDataSource {
  Future<void> cacheLoginData({required LoginModel loginModel});
  Future<LoginModel?> getCachedLoginData();
  Future<void> clearCachedLoginData();
}
