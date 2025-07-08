import 'package:dartz/dartz.dart';
import 'package:services/error_handler/data_source.dart';
import 'package:services/error_handler/data_source_extension.dart';
import 'package:services/error_handler/dio_error_hanlder.dart';
import 'package:services/error_handler/failure.dart';
import 'package:services/network_info/network_info.dart';
Future<Either<Failure, T>> safeApiCall<T>(
    NetworkInfo networkInfo, Future<T> Function() apiCall) async {
  if (await networkInfo.isConnected) {
    try {
      final result = await apiCall();
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  } else {
    return Left(DataSource.notInternetConnection.getFailure());
  }
}
