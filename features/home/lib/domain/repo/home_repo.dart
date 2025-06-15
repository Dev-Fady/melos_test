import 'package:dartz/dartz.dart';
import 'package:home/domain/entites/home_entity.dart';
import 'package:services/error_handler/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, HomeEntity>> getHomeData();
}
