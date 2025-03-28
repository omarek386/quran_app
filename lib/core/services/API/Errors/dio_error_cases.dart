import 'package:dio/dio.dart';

import 'error_model.dart';
import 'server_errors.dart';

class DioErrorCases {
  static void throwDioExceptions(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.sendTimeout:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.badCertificate:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.cancel:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.connectionError:
      //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      case DioExceptionType.unknown:
        throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
      //*=======================================================
      case DioExceptionType.badResponse:
        // throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
        switch (e.response!.statusCode) {
          case 400:
          //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
          case 401:
          //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
          case 402:
          //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
          case 403:
          //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
          case 404:
          //  throw ServerErrors(errorModel: ErrorModel.fromJson(e.response!.data));
          case 500:
            throw ServerErrors(
                errorModel: ErrorModel.fromJson(e.response!.data));
          default:
            throw ServerErrors(
                errorModel: ErrorModel.fromJson(e.response!.data));
        }
    }
  }
}
