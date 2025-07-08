import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:services/constants/constants.dart';

class DioFactory {
  final String baseUrl;
  final String accessToken;
  final String language;

  DioFactory({
    required this.baseUrl,
    required this.accessToken,
    required this.language,
  });

  Dio getDio() {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: accessToken,
      defaultLanguage: language,
      clientId: "app_client_id" // todo get app client id
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }

    return dio;
  }
}
