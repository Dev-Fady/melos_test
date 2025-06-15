import 'package:dartz/dartz.dart';
import 'package:home/data/model/home_model.dart';
import 'package:services/error_handler/failure.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, HomeModel>> getHomeData({required String token});
}
