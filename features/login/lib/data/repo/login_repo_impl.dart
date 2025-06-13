import 'package:dartz/dartz.dart';
import 'package:login/data/mapper/login_mapper.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/entites/login_entity.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:services/error_handler/failure.dart';

class LoginRepoImpl implements LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSourcel;

  LoginRepoImpl({required this.loginRemoteDataSourcel});

  @override
  Future<Either<Failure, LoginEntity>> login(
      {required LoginRequest loginRequest}) async {
    final result =
        await loginRemoteDataSourcel.login(loginRequest: loginRequest);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.toEntity()),
    );
  }
}
