import 'package:dio/dio.dart';
import 'package:home/data/model/home_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'home_server.g.dart';

const String baseUrl = "https://api.escuelajs.co/api/v1";

@RestApi(baseUrl: baseUrl)
abstract class HomeServer {
  factory HomeServer(Dio dio, {String baseUrl, ParseErrorLogger? errorLogger}) =
      _HomeServer;

  @GET("/auth/profile")
  Future<HttpResponse<HomeModel>> getHomeData(
    @Header("Authorization") String token,
  );
}
