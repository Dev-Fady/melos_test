import 'package:dartz/dartz.dart';
import 'package:login/domain/entites/login_entity.dart';
import 'package:services/error_handler/failure.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password,
  });
}
