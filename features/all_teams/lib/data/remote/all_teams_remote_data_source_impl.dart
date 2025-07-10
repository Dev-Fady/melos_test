import 'package:all_teams/data/model/all_teams_response_model.dart';
import 'package:all_teams/data/remote/all_teams_remote_data_source.dart';
import 'package:all_teams/data/server/all_teams_server.dart';
import 'package:dartz/dartz.dart';
import 'package:services/error_handler/failure.dart';
import 'package:services/network/safe_api_call.dart';
import 'package:services/network_info/network_info.dart';

class AllTeamsRemoteDataSourceImpl implements AllTeamsRemoteDataSource {
  final AllTeamsServer allTeamsServer;
  final NetworkInfo networkInfo;

  AllTeamsRemoteDataSourceImpl({
    required this.allTeamsServer,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, AllTeamsResponseModel>> getAllTeams({
    required String version,
    required String sport,
    required int page,
  }) {
    return safeApiCall(networkInfo, () async {
      final response = await allTeamsServer.getAllTeams(
        version: version,
        sport: sport,
        page: page,
      );
      return response.data;
    });
  }
}
