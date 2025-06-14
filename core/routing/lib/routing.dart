import 'package:go_router/go_router.dart';
import 'package:login/presenatation/login_screen.dart';
import 'package:routing/router_name.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    routes: [
      GoRoute(
        path: RouterName.login,
        builder: (context, state) {
          return LoginScreen();
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
