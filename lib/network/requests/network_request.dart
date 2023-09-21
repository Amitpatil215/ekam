import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../endpoints.dart';
import '../interceptors/logger_interceptor.dart';
import '../network_services/dio_exception.dart';

class RequestClient {
  RequestClient()
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

  Future<Response> getDoctorsRequest() async {
    try {
      final response = await _dio.get(
        "/githubforekam/doctor-appointment/doctors",
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
  Future<Response> getPackageRequest() async {
    try {
      final response = await _dio.get(
        "/githubforekam/doctor-appointment/appointment_options",
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
  Future<Response> getBookingRequest() async {
    try {
      final response = await _dio.get(
        "/githubforekam/doctor-appointment/appointments",
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
