import 'package:constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login/data/service/login_service.dart';
import 'package:services/factory/dio_factory.dart';
import 'package:services/network_info/network_info.dart';
import 'package:services/network_info/network_info_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Network Info
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Dio Factory
  getIt.registerLazySingleton<DioFactory>(() => DioFactory(
        baseUrl: AppConstants.baseUrl,
        accessToken: AppConstants.defaultAccessToken,
        language: AppConstants.defaultLanguage,
      ));

  // Dio - must be retrieved after registering DioFactory
  final dioFactory = getIt<DioFactory>();
  final dio = dioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Login Service (Retrofit)
  getIt.registerLazySingleton<LoginService>(() => LoginService(dio));
}
