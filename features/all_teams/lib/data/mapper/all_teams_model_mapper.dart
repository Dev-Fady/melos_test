import 'package:all_teams/data/model/all_team_model.dart';
import 'package:all_teams/domian/entites/all_teams_entity.dart';

extension AllTeamsModelMapper on AllTeamModel {
  AllTeamsEntity toEntity() {
    return AllTeamsEntity(
      name: name ?? 'Unknown Team',
      imagePath: imagePath ?? 'https://example.com/default_image.png',
      founded: founded ?? 0,
      lastPlayed: lastPlayed ?? DateTime.now(),
    );
  }
}
