import 'package:texi_driver/features/auth/data/models/login_data_model.dart';
import 'package:texi_driver/features/auth/data/models/login_error_model.dart';

class LoginResponse {
  final String code;
  final LoginDataModel? data;
  final LoginErrorModel? error;
  final String message;
  final int statusCode;
  final bool success;

  LoginResponse({
    required this.code,
    this.data,
    this.error,
    required this.message,
    required this.statusCode,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'],
      data: json['data'] != null ? LoginDataModel.fromJson(json['data']) : null,
      error: json['error'] != null
          ? LoginErrorModel.fromJson(json['error'])
          : null,
      message: json['message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }
}
