import 'package:flutter/material.dart';
import 'package:main_navigation/models/rive_model.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.riveIcon,
    required this.isActive,
  });

  final bool isActive;
  final RiveModel riveIcon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: riveIcon.status?.value == true
            ? Colors.white
            : const Color(0xFF81B4FF),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
    );
  }
}
