import 'package:all_teams/domian/entites/all_teams_response_entity.dart';
import 'package:all_teams/domian/repo/all_teams_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'all_teams_state.dart';

class AllTeamsCubit extends Cubit<AllTeamsState> {
  AllTeamsCubit({required this.allTeamsRepo}) : super(AllTeamsInitial());
  final AllTeamsRepo allTeamsRepo;

  Future<void> getAllTeams({required int page}) async {
    emit(AllTeamsLoading());
    final result = await allTeamsRepo.getAllTeams(page: page);
    result.fold(
      (failure) {
        emit(AllTeamsFailure(errorMessage: failure.message));
      },
      (allTeamsResponseEntity) {
        emit(AllTeamsSuccess(allTeamsResponseEntity: allTeamsResponseEntity));
      },
    );
  }
}
