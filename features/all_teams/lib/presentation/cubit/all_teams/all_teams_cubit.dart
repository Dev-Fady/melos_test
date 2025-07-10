import 'package:all_teams/domian/entites/all_teams_entity.dart';
import 'package:all_teams/domian/repo/all_teams_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_teams_state.dart';

class AllTeamsCubit extends Cubit<AllTeamsState> {
  AllTeamsCubit({required this.allTeamsRepo}) : super(AllTeamsInitial());

  final AllTeamsRepo allTeamsRepo;

  List<AllTeamsEntity> teams = [];

  int currentPage = 1;
  bool hasMore = true;
  bool isLoading = false;

  Future<void> getAllTeams({int page = 1}) async {
    if (isLoading || !hasMore) return;

    isLoading = true;

    if (page == 1) {
      emit(AllTeamsLoading());
    } else {
      emit(AllTeamsPaginationLoading());
    }

    final result = await allTeamsRepo.getAllTeams(page: page);

    result.fold((failure) {
      if (page == 1) {
        emit(AllTeamsFailure(errorMessage: failure.message));
      } else {
        emit(AllTeamsPaginationFailure(errorMessage: failure.message));
      }
    }, (data) {
      teams.addAll(data.teams);
      hasMore = data.hasMore;
      currentPage = data.currentPage + 1;

      emit(AllTeamsSuccess(teams: teams));
    });

    isLoading = false;
  }
}
