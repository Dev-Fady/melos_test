import 'package:dio/dio.dart';
import 'package:login/data/model/login_model.dart';
import 'package:login/data/request/login_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/error_logger.dart';

part 'login_service.g.dart';

const String baseUrl = "https://api.escuelajs.co/api/v1";

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _LoginService;

  @POST("/auth/login")
  Future<HttpResponse<LoginModel>> login(
    @Body() LoginRequest request,
  );
}
