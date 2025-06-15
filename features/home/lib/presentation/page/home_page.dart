import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/presentation/page/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}
