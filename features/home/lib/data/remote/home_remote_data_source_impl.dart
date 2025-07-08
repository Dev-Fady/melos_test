import 'package:dartz/dartz.dart';
import 'package:home/data/model/home_model.dart';
import 'package:home/data/remote/home_remote_data_source.dart';
import 'package:home/data/server/home_server.dart';
import 'package:services/error_handler/failure.dart';
import 'package:services/network/safe_api_call.dart';
import 'package:services/network_info/network_info.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeServer homeServer;
  final NetworkInfo networkInfo;

  HomeRemoteDataSourceImpl({
    required this.homeServer,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, HomeModel>> getHomeData({required String token}) {
    return safeApiCall(
      networkInfo,
      () async {
        final response = await homeServer.getHomeData("Bearer $token");
        return response.data;
      },
    );
  }
}
