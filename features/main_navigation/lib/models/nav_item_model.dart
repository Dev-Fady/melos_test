import 'package:main_navigation/models/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: "Home",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
  ),
  NavItemModel(
    title: "Search",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Bell",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "BELL",
      stateMachineName: "BELL_Interactivity",
    ),
  ),
  NavItemModel(
    title: "Settings",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "SETTINGS",
      stateMachineName: "SETTINGS_Interactivity",
    ),
  ),
  NavItemModel(
    title: "LIKE/STAR",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity",
    ),
  ),
  NavItemModel(
    title: "User",
    rive: RiveModel(
      src: "assets/animated_icon_set_-_1_color.riv",
      artboard: "USER",
      stateMachineName: "USER_Interactivity",
    ),
  ),
];
