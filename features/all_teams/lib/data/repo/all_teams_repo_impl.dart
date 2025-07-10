import 'package:all_teams/data/local_data/all_teams_loacl_data_source.dart';
import 'package:all_teams/data/mapper/all_teams_response_model_mapper.dart';
import 'package:all_teams/data/remote/all_teams_remote_data_source.dart';
import 'package:all_teams/domian/entites/all_teams_response_entity.dart';
import 'package:all_teams/domian/repo/all_teams_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:services/error_handler/failure.dart';

class AllTeamsRepoImpl implements AllTeamsRepo {
  final AllTeamsRemoteDataSource remoteDataSource;
  final AllTeamsLoaclDataSource loaclDataSource;
  AllTeamsRepoImpl({
    required this.remoteDataSource,
    required this.loaclDataSource,
  });

  @override
  Future<Either<Failure, AllTeamsResponseEntity>> getAllTeams({
    required int page,
  }) async {
    final result = await remoteDataSource.getAllTeams(
      version: 'v3',
      sport: 'football',
      page: page,
    );
    return result.fold(
      (failure) {
        return Left(failure);
      },
      (response) {
        loaclDataSource.cacheAllTeamsData(allTeamsResponseModel: response);
        return Right(response.toEntity());
      },
    );
  }
}
