import 'package:flutter/material.dart';
import 'package:main_navigation/presentation/widget/bottom_nav_bar.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedNavIndex = 0;

  final List<String> pages = [
    'Home',
    'Search',
    'Notifications',
    'Settings',
    'Star',
    'User',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Selected Page: ${pages[selectedNavIndex]}',
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedNavIndex,
        onItemSelected: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
      ),
    );
  }
}
