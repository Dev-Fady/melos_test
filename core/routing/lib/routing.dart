import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
          return HomeScreen();
        },
      ),
    ],
  );
}

GoRouter initializeRouter() {
  // final bool isLogin = CacheHelper().getData(key: 'isLogin') ?? false;
  // return createRouter(isLogin ? RouterName.userPage : RouterName.homePage);
  return createRouter(RouterName.login);
}
