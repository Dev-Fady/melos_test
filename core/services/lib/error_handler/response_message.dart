import 'package:services/error_handler/app_strings.dart';

class ResponseMessage {
  static const String success = AppStrings.success;
  static const String noContent = AppStrings.noContent;
  static const String badRequest = AppStrings.badRequest;
  static const String unauthorized = AppStrings.unauthorised;
  static const String internalServerError = AppStrings.internalServerError;
  static const String forbidden = AppStrings.forbidden;

  // local error form app
  static const String connectTimeout = AppStrings.connectTimeout;
  static const String cancelled = AppStrings.cancelled;
  static const String receiveTimeout = AppStrings.receiveTimeout;
  static const String sendTimeout = AppStrings.sendTimeout;
  static const String cacheError = AppStrings.cacheError;
  static const String noInternetConnection = AppStrings.noInternetConnection;
  static const String defaultError = AppStrings.defaultError;
}
