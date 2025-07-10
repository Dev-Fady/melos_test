part of 'all_teams_cubit.dart';

@immutable
sealed class AllTeamsState {}

final class AllTeamsInitial extends AllTeamsState {}

final class AllTeamsLoading extends AllTeamsState {}

final class AllTeamsSuccess extends AllTeamsState {
  final AllTeamsResponseEntity allTeamsResponseEntity;

  AllTeamsSuccess({required this.allTeamsResponseEntity});
}

final class AllTeamsFailure extends AllTeamsState {
  final String errorMessage;

  AllTeamsFailure({required this.errorMessage});
}
