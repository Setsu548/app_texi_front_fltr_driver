// lib/data/services/auth_service.dart
import 'package:dio/dio.dart';
import '../../app/api_dio.dart';
import '../../app/api_response.dart';
import '../models/document_info.dart';
import '../models/login_response.dart';
import '../models/personal_info_model.dart';

class AuthService {
  final ApiDio _api = ApiDio();

  Future<ApiResponse<LoginResponse>> login(String email, String password, String brand, String model, String os, String ip) async {
    try {
      final response = await _api.dio.post(
        '/auth/login',
        data: {'user_name': email, 'password': password,"brand": brand, "model": model, "os": os, "ip": ip},
      );

      return ApiResponse<LoginResponse>.fromJson(
        response.data,
        (data) => LoginResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Error de conexión';
      throw Exception('Error en login: $message');
    }
  }
  
  Future<ApiResponse<PersonalInfoResponse>> personalInfo(PersonalInfoModel personalInfo) async {
    try {
      final response = await _api.dio.post(
        '/users/driver/personal-info',
        data: personalInfo.toJson(),
      );

      return ApiResponse<PersonalInfoResponse>.fromJson(
        response.data,
        (data) => PersonalInfoResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Error de conexión';
      throw Exception('Error en personalInfo: $message');
    }
  }

  Future<ApiResponse<DocumentInfoResponse>> documentInfo(DocumentInfo documentInfo) async {
    try {
      final response = await _api.dio.post(
        '/users/driver/document-info',
        data: documentInfo.toJson(),
      );

      return ApiResponse<DocumentInfoResponse>.fromJson(
        response.data,
        (data) => DocumentInfoResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Error de conexión';
      throw Exception('Error en documentInfo: $message');
    }
  }

}
