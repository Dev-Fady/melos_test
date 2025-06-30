import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:main_navigation/models/nav_item_model.dart';
import 'package:main_navigation/models/rive_model.dart';

import 'bottom_nav_item.dart';

const Color bottonNavColor = Color(0xFF17203A);

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<SMIBool> riveIconInputs = [];
  final List<StateMachineController?> controllers = [];

  void animateTheIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(const Duration(seconds: 1), () {
      riveIconInputs[index].change(false);
    });
  }

  void riveOnInit(Artboard artboard, RiveModel riveIcon) {
    final controller = StateMachineController.fromArtboard(
      artboard,
      riveIcon.stateMachineName,
    );
    artboard.addController(controller!);
    controllers.add(controller);
    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: bottonNavColor.withOpacity(0.8),
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: bottonNavColor.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomNavItems.length, (index) {
            final riveIcon = bottomNavItems[index].rive;
            return BottomNavItem(
              riveIcon: riveIcon,
              isActive: widget.selectedIndex == index,
              onTap: () {
                animateTheIcon(index);
                widget.onItemSelected(index);
              },
              onInit: (artboard) => riveOnInit(artboard, riveIcon),
            );
          }),
        ),
      ),
    );
  }
}
