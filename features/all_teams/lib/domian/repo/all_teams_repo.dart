import 'package:all_teams/domian/entites/all_teams_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:services/error_handler/failure.dart';

abstract class AllTeamsRepo {
  Future<Either<Failure, AllTeamsResponseEntity>> getAllTeams({
    required int page,
  });
}
