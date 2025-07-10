import 'package:all_teams/data/local_data/all_teams_loacl_data_source.dart';
import 'package:all_teams/data/local_data/all_teams_loacl_data_source_impl.dart';
import 'package:all_teams/data/remote/all_teams_remote_data_source.dart';
import 'package:all_teams/data/remote/all_teams_remote_data_source_impl.dart';
import 'package:all_teams/data/repo/all_teams_repo_impl.dart';
import 'package:all_teams/data/server/all_teams_server.dart';
import 'package:all_teams/domian/repo/all_teams_repo.dart';
import 'package:constants/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home/data/local_data/home_local_data_source.dart';
import 'package:home/data/local_data/home_local_data_source_impl.dart';
import 'package:home/data/remote/home_remote_data_source.dart';
import 'package:home/data/remote/home_remote_data_source_impl.dart';
import 'package:home/data/repo/home_repo_impl.dart';
import 'package:home/data/server/home_server.dart';
import 'package:home/domain/repo/home_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:login/data/local_data/login_local_data_scurce.dart';
import 'package:login/data/local_data/login_local_data_scurce_impl.dart';
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
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(getIt()),
  ); // getIt() here means: give me the InternetConnectionChecker

  // Dio Factory
  getIt.registerLazySingleton<DioFactory>(
    () => DioFactory(
      baseUrl: AppConstants.baseUrl,
      accessToken: AppConstants.defaultAccessToken,
      language: AppConstants.defaultLanguage,
    ),
  );

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
    ),
  );

  getIt.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataScurceImpl(),
  );

  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepoImpl(
      loginRemoteDataSourcel: getIt<LoginRemoteDataSource>(),
      localDataSource: getIt<LoginLocalDataSource>(),
    ),
  );

  //  home Service (Retrofit)
  getIt.registerLazySingleton<HomeServer>(() => HomeServer(dio));

  // home Remote Data Source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(
      homeServer: getIt<HomeServer>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // home local data source
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  // home Repo
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
      loginLocalDataSource: getIt<LoginLocalDataSource>(),
      homeLocalDataSource: getIt<HomeLocalDataSource>(),
    ),
  );

  // all teams service (Retrofit)
  getIt.registerLazySingleton<AllTeamsServer>(() => AllTeamsServer(dio));

  // all teams Remote Data Source
  getIt.registerLazySingleton<AllTeamsRemoteDataSource>(
    () => AllTeamsRemoteDataSourceImpl(
      allTeamsServer: getIt<AllTeamsServer>(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  // all teams local data source
  getIt.registerLazySingleton<AllTeamsLoaclDataSource>(
    () => AllTeamsLoaclDataSourceImpl(),
  );

  // all teams Repo
  getIt.registerLazySingleton<AllTeamsRepo>(
    () => AllTeamsRepoImpl(
      remoteDataSource: getIt<AllTeamsRemoteDataSource>(),
      loaclDataSource: getIt<AllTeamsLoaclDataSource>(),
    ),
  );
}
