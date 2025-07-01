import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/presentation/cubit/home_cubit/home_cubit_cubit.dart';
import 'package:home/presentation/page/home_page_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubitCubit>().getHomedata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}
