import 'package:all_teams/presentation/cubit/all_teams/all_teams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AllTeamsPageBody extends StatefulWidget {
  const AllTeamsPageBody({super.key});

  @override
  State<AllTeamsPageBody> createState() => _AllTeamsPageBodyState();
}

class _AllTeamsPageBodyState extends State<AllTeamsPageBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);

    // أول تحميل للبيانات
    context.read<AllTeamsCubit>().getAllTeams(page: 1);
  }

  void _onScroll() {
    final cubit = context.read<AllTeamsCubit>();
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 300 &&
        !cubit.isLoading &&
        cubit.hasMore) {
      cubit.getAllTeams(page: cubit.currentPage);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTeamsCubit, AllTeamsState>(
      builder: (context, state) {
        final cubit = context.read<AllTeamsCubit>();
        final teams = cubit.teams;

        if (state is AllTeamsLoading && teams.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is AllTeamsFailure && teams.isEmpty) {
          return Center(child: Text(state.errorMessage));
        }

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade100, Colors.blue.shade100],
            ),
          ),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            itemCount: teams.length + (cubit.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < teams.length) {
                final team = teams[index];
                // final DateTime lastPlayedDate = DateTime(t);
                final String formattedDate =
                    DateFormat('MMMM d, y').format(team.lastPlayed);
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.imagePath),
                      radius: 30,
                    ),
                    title: Text(
                      team.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 5),
                            Text('Founded: ${team.founded}'),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          children: [
                            const Icon(Icons.sports_soccer, size: 16),
                            const SizedBox(width: 5),
                            Text('Last Played: $formattedDate'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                // عرض لودينج تحت الليست
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      },
    );
  }
}
