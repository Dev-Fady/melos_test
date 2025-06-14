import 'package:constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/remote/login_remote_data_source_impl.dart';
import 'package:login/data/repo/login_repo_impl.dart';
import 'package:login/data/service/login_service.dart';
import 'package:login/domain/repository/login_repository.dart';
import 'package:services/factory/dio_factory.dart';
import 'package:services/network_info/network_info.dart';
import 'package:services/network_info/network_info_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      getIt())); // getIt() here means: give me the InternetConnectionChecker

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

  // Login Remote Data Source
  getIt.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(
            loginService: getIt<LoginService>(),
            networkInfo: getIt<NetworkInfo>(),
          ));

  getIt.registerLazySingleton<LoginRepository>(() => LoginRepoImpl(
      loginRemoteDataSourcel: getIt<LoginRemoteDataSource>()));
}
