import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home/presentation/widget/card_details.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CardDetails(),
    );
  }
}

