import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'secure_storage.dart';

class ApiDio {
  final Dio dio;

  ApiDio._internal(this.dio);

  factory ApiDio() {
    final dio = Dio(BaseOptions(
      baseUrl: 'http://ec2-3-150-198-57.us-east-2.compute.amazonaws.com:8001/api/v1',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    // Agregar interceptores
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // antes de enviar la solicitud
        String? token = await SecureTokenStorage.getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
          debugPrint('🚗 token $token');
        }
        // continuar
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // puedes revisar respuestas aquí
        return handler.next(response);
      },
      onError: (DioError err, handler) {
        // manejo global de errores
        if (err.response?.statusCode == 401) {
          // por ejemplo, logout o refresh token
        }
        return handler.next(err);
      },
    ));

    return ApiDio._internal(dio);
  }
}
