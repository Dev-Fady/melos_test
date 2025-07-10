import 'package:all_teams/data/model/all_teams_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:services/error_handler/failure.dart';

abstract class AllTeamsRemoteDataSource {
  Future<Either<Failure, AllTeamsResponseModel>> getAllTeams({
    required String version,
    required String sport,
    required int page,
  });
}
