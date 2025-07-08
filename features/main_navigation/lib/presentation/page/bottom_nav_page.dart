import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:main_navigation/presentation/widget/bottom_nav_bar.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int selectedNavIndex = 0;

  final List<Widget> pages = [
    Center(child: Text('Search')),
    Center(child: Text('Notifications')),
    Center(child: Text('Settings')),
    Center(child: Text('Star')),
    Center(child: Text('Star2')),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedNavIndex],
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
