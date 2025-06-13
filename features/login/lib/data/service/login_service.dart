import 'package:dio/dio.dart';
import 'package:login/data/model/login_model.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'login_service.g.dart';

const String baseUrl = "https://minafarid.mocklab.io";

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio,
      {String baseUrl, ParseErrorLogger errorLogger}) = _LoginService;

  @POST("/customers/login")
  Future<HttpResponse<LoginModel>> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
