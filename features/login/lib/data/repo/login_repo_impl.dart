import 'package:dartz/dartz.dart';
import 'package:login/data/local_data/login_local_data_scurce.dart';
import 'package:login/data/mapper/login_mapper.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/entites/login_entity.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:services/error_handler/failure.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSourcel;
  final LoginLocalDataSource localDataSource;

  LoginRepoImpl(
      {required this.loginRemoteDataSourcel, required this.localDataSource});

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await loginRemoteDataSourcel.login(
        loginRequest: LoginRequest(email: email, password: password));
    return result.fold(
      (failure) => Left(failure),
      (response) {
        localDataSource.cacheLoginData(loginModel: response);
        return Right(response.toEntity());
      },
    );
  }
}
