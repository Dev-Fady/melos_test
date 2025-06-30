import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:main_navigation/models/rive_model.dart';
import 'animated_bar.dart';

class BottomNavItem extends StatelessWidget {
  final RiveModel riveIcon;
  final bool isActive;
  final VoidCallback onTap;
  final void Function(Artboard) onInit;

  const BottomNavItem({
    super.key,
    required this.riveIcon,
    required this.isActive,
    required this.onTap,
    required this.onInit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBar(riveIcon: riveIcon, isActive: isActive),
        SizedBox(
          width: 36,
          height: 36,
          child: GestureDetector(
            onTap: onTap,
            child: Opacity(
              opacity: isActive ? 1 : 0.5,
              child: RiveAnimation.asset(
                riveIcon.src,
                artboard: riveIcon.artboard,
                stateMachines: [riveIcon.stateMachineName],
                onInit: onInit,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
