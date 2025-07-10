part of 'all_teams_cubit.dart';

@immutable
sealed class AllTeamsState {}

final class AllTeamsInitial extends AllTeamsState {}

final class AllTeamsLoading extends AllTeamsState {}

class AllTeamsPaginationLoading extends AllTeamsState {}

class AllTeamsSuccess extends AllTeamsState {
  final List<AllTeamsEntity> teams;
  AllTeamsSuccess({required this.teams});
}

class AllTeamsFailure extends AllTeamsState {
  final String errorMessage;
  AllTeamsFailure({required this.errorMessage});
}

class AllTeamsPaginationFailure extends AllTeamsState {
  final String errorMessage;
  AllTeamsPaginationFailure({required this.errorMessage});
}
