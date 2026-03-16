import 'package:texi_driver/features/register_driver/data/models/country_model.dart';

class GeoDataResModel {
  final String code;
  final CountryModel? data;
  final GeoDataError? error;
  String? message;
  final int status;

  GeoDataResModel({
    required this.code,
    this.data,
    this.error,
    this.message,
    required this.status,
  });

  factory GeoDataResModel.fromJson(Map<String, dynamic> json) {
    return GeoDataResModel(
      code: json['code'] as String,
      data: CountryModel.fromJson(json['data']),
      message: json['message'],
      status: json['status'] as int,
    );
  }

  factory GeoDataResModel.fromError(
    Map<String, dynamic> json,
    int status,
    String message,
  ) {
    return GeoDataResModel(
      code: json['code'] as String,
      error: GeoDataError.fromJson(json),
      message: json['details'],
      status: status,
    );
  }
}

class GeoDataError {
  final String code;
  final String message;
  final String details;

  GeoDataError({
    required this.code,
    required this.message,
    required this.details,
  });

  factory GeoDataError.fromJson(Map<String, dynamic> json) {
    return GeoDataError(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as String,
    );
  }
}
