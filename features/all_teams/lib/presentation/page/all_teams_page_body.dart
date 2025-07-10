import 'package:all_teams/presentation/cubit/all_teams/all_teams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTeamsPageBody extends StatelessWidget {
  const AllTeamsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTeamsCubit, AllTeamsState>(
      builder: (context, state) {
        if (state is AllTeamsSuccess) {
          final teams = state.allTeamsResponseEntity.teams;
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade100, Colors.blue.shade100],
              ),
            ),
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: state.allTeamsResponseEntity.teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(team.imagePath),
                      radius: 30,
                    ),
                    title: Text(
                      team.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16),
                            SizedBox(width: 5),
                            Text('تأسس: ${team.founded}'),
                          ],
                        ),
                        SizedBox(height: 3),
                        Row(
                          children: [
                            Icon(Icons.sports_soccer, size: 16),
                            SizedBox(width: 5),
                            Text('آخر مباراة: ${team.lastPlayed}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is AllTeamsLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AllTeamsFailure) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
