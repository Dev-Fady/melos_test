import 'package:all_teams/presentation/cubit/all_teams/all_teams_cubit.dart';
import 'package:all_teams/presentation/page/all_teams_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTeamsPage extends StatefulWidget {
  const AllTeamsPage({super.key});

  @override
  State<AllTeamsPage> createState() => _AllTeamsPageState();
}

class _AllTeamsPageState extends State<AllTeamsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AllTeamsCubit>().getAllTeams(page: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الفرق الرياضية'), elevation: 0),
      body: AllTeamsPageBody(),
    );
  }
}
