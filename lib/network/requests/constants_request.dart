import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../endpoints.dart';
import '../interceptors/logger_interceptor.dart';
import '../network_services/dio_exception.dart';

class ConstantsRequestClient {
  ConstantsRequestClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: Endpoints.baseURL,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            LoggerInterceptor(),
          ]);

  late final Dio _dio;

  Future<Response> getCentersRequest() async {
    try {
      final response = await _dio.post(
        Endpoints.genericapiEndpoint,
        data: {
          "key": "CRM",
          "OperationName": "getCenters",
          "OperationType": "G"
        },
      );
      return response;
    } on DioError catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Response> getDoctorsRequest() async {
    try {
      final response = await _dio.post(
        Endpoints.genericapiEndpoint,
        data: {
          "key": "CRM",
          "OperationName": "getDoctors",
          "OperationType": "G"
        },
      );
      return response;
    } on DioError catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }

  Future<Response> getClientsRequest() async {
    try {
      final response = await _dio.post(
        Endpoints.genericapiEndpoint,
        data: {
          "key": "CRM",
          "OperationName": "getClients",
          "OperationType": "G"
        },
      );
      return response;
    } on DioError catch (err) {
      final errorMessage = DioExceptionHandler.fromDioError(err).toString();
      throw errorMessage;
    } catch (e) {
      if (kDebugMode) print(e);
      throw e.toString();
    }
  }
}
