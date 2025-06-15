import 'package:cache/cache_helper.dart';
import 'package:constants/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home/domain/repo/home_repo.dart';
import 'package:home/presentation/cubit/home_cubit/home_cubit_cubit.dart';
import 'package:home/presentation/home_screen.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:login/presenatation/cubit/login/login_cubit.dart';
import 'package:login/presenatation/login_screen.dart';
import 'package:melos_test/DI/dependency_injection.dart';
import 'package:routing/router_name.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    routes: [
      GoRoute(
        path: RouterName.login,
        name: RouterName.login,
        builder: (context, state) {
          return LoginScreen();
        },
      ),
      GoRoute(
        path: '/',
        name: '/',
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                LoginCubit(loginRepository: getIt<LoginRepository>()),
            child: LoginScreen(),
          );
        },
      ),
      GoRoute(
        path: RouterName.home,
        name: RouterName.home,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                HomeCubitCubit(homeRepo: getIt<HomeRepo>())..getHomedata(),
            child: HomeScreen(),
          );
        },
      ),
    ],
  );
}

GoRouter initializeRouter() {
  final bool isLogin =
      CacheHelper().getData(key: AppConstants.iSLOGIN) ?? false;
  return createRouter(isLogin ? RouterName.home : RouterName.login);
  // return createRouter(RouterName.login);
}
