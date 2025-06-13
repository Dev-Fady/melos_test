import 'package:dartz/dartz.dart';
import 'package:login/data/model/login_model.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/service/login_service.dart';
import 'package:services/error_handler/failure.dart';
import 'package:services/network/safe_api_call.dart';
import 'package:services/network_info/network_info.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final LoginService loginService;
  final NetworkInfo networkInfo;
  LoginRemoteDataSourceImpl({required this.loginService, required this.networkInfo});

  @override
  Future<Either<Failure, LoginModel>> login(
      {required LoginRequest loginRequest}) {
    return safeApiCall(
      networkInfo,
      () async {
        final response =
            await loginService.login(loginRequest.email, loginRequest.password);
        return response.data;
      },
    );
  }
}
