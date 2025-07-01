import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/domain/repo/home_repo.dart';
import 'package:home/presentation/cubit/home_cubit/home_cubit_cubit.dart';
import 'package:home/presentation/page/home_page.dart';
import 'package:melos_test/DI/dependency_injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => HomeCubitCubit(homeRepo:  getIt<HomeRepo>()..getHomeData() ),
      child: HomePage(),
    );
  }
}
