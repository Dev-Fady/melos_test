import 'package:all_teams/domian/repo/all_teams_repo.dart';
import 'package:all_teams/presentation/cubit/all_teams/all_teams_cubit.dart';
import 'package:all_teams/presentation/page/all_teams_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melos_app/DI/dependency_injection.dart';

class AllTeams extends StatelessWidget {
  const AllTeams({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllTeamsCubit(
        allTeamsRepo: getIt<AllTeamsRepo>()..getAllTeams(page: 1),
      ),
      child: AllTeamsPage(),
    );
  }
}
