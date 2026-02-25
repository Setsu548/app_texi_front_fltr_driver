import 'dart:convert';
import 'package:texi/core/constants/data_api_response.dart';

class DriverDataResModel extends DataApiResponse<DriverDataModel> {
  DriverDataResModel({
    required super.success,
    required super.statusCode,
    required super.code,
    required super.message,
    required super.data,
    required super.error,
  });

  factory DriverDataResModel.fromJson(Map<String, dynamic> json) {
    return DriverDataResModel(
      success: json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      data: json['data'] != null
          ? DriverDataModel.fromJson(json['data'])
          : null,
      error: json['error'] != null
          ? ErrorResponse.fromJson(json['error'])
          : null,
    );
  }

  factory DriverDataResModel.fromError(Map<String, dynamic> json) {
    return DriverDataResModel(
      success: json['success'] ?? false,
      statusCode: json['status_code'] ?? 0,
      code: json['code'] ?? '',
      message: json['message'] ?? '',
      data: null,
      error: json['error'] != null
          ? ErrorResponse.fromJson(json['error'])
          : null,
    );
  }

  factory DriverDataResModel.fromErrorCatch({
    required bool success,
    required int statusCode,
    required String code,
    required String message,
    required DriverDataModel? data,
  }) => DriverDataResModel(
    success: success,
    statusCode: statusCode,
    code: code,
    message: message,
    data: null,
    error: ErrorResponse(message: message, details: ''),
  );
}

class DriverDataModel {
  final String uuid;
  final String phoneNumber;
  final bool isVerified;

  DriverDataModel({
    required this.uuid,
    required this.phoneNumber,
    required this.isVerified,
  });

  factory DriverDataModel.fromJson(Map<String, dynamic> json) =>
      DriverDataModel(
        uuid: json['uuid'] ?? '',
        phoneNumber: json['phone_number'] ?? '',
        isVerified: json['is_verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'phone_number': phoneNumber,
    'is_verified': isVerified,
  };

  factory DriverDataModel.fromRawJson(String str) =>
      DriverDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
