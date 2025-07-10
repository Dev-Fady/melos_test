import 'package:all_teams/presentation/page/all_teams_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllTeamsPage extends StatelessWidget {
  const AllTeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الفرق الرياضية'), elevation: 0),
      body: AllTeamsPageBody(),
    );
  }
}
