import 'package:all_teams/domian/entites/all_teams_entity.dart';

class AllTeamsResponseEntity {
  final List<AllTeamsEntity> teams;
  final int currentPage;
  final bool hasMore;

  AllTeamsResponseEntity({
    required this.teams,
    required this.currentPage,
    required this.hasMore,
  });
}
