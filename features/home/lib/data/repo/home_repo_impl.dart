import 'package:dartz/dartz.dart';
import 'package:home/data/local_data/home_local_data_source.dart';
import 'package:home/data/mapper/home_mapper.dart';
import 'package:home/data/remote/home_remote_data_source.dart';
import 'package:home/domain/entites/home_entity.dart';
import 'package:home/domain/repo/home_repo.dart';
import 'package:login/data/local_data/login_local_data_scurce.dart';
import 'package:services/error_handler/failure.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource,
      required this.loginLocalDataSource,
      required this.homeLocalDataSource});

  @override
  Future<Either<Failure, HomeEntity>> getHomeData() async {
    final loginModel = await loginLocalDataSource.getCachedLoginData();
    final token = loginModel?.accessToken ?? '';
    final result = await homeRemoteDataSource.getHomeData(token: token);
    return result.fold(
      (failure) => Left(failure),
      (response) {
        homeLocalDataSource.cacheHomeData(homeModel: response);
        return Right(response.toEntity());
      },
    );
  }
}
