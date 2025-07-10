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
    return await result.fold(
      (failure) async {
        //? Try to retrieve data from the cache only if it is the first page.
        if (page == 1) {
          final cachedData = await loaclDataSource.getCachedAllTeamsData();
          if (cachedData != null) {
            return Right(cachedData.toEntity());
          }
        }
        return Left(failure);
      },
      (response) {
        // ? If the data from the Internet is successful, save it in the cache (only the first page)
        if (page == 1) {
          loaclDataSource.cacheAllTeamsData(allTeamsResponseModel: response);
        }
        return Right(response.toEntity());
      },
    );
  }
}
