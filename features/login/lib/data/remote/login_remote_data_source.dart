import 'package:dartz/dartz.dart';
import 'package:login/data/model/login_model.dart';
import 'package:login/data/request/login_request.dart';
import 'package:services/error_handler/failure.dart';

abstract class LoginRemoteDataSource {
  Future<Either<Failure, LoginModel>> login({
    required LoginRequest loginRequest,
  });
}
