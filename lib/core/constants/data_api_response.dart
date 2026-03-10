class DataApiResponse<T> {
  final bool success;
  final int statusCode;
  final String code;
  final String message;
  final T? data;
  final ErrorResponse? error;

  DataApiResponse({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
    required this.error,
  });

  factory DataApiResponse.fromJson(
    Map<String, dynamic> json, [
    T Function(dynamic)? fromJsonT,
  ]) => DataApiResponse(
    success: json['success'] ?? false,
    statusCode: json['status_code'] ?? 0,
    code: json['code'] ?? '',
    message: json['message'] ?? '',
    data: null,
    error: null,
  );

  factory DataApiResponse.fromSuccess(
    Map<String, dynamic> json, [
    T Function(dynamic)? fromJsonT,
  ]) => DataApiResponse(
    success: json['success'] ?? false,
    statusCode: json['status_code'] ?? 0,
    code: json['code'] ?? '',
    message: json['message'] ?? '',
    data: json['data'] != null && fromJsonT != null
        ? fromJsonT(json['data'])
        : null,
    error: null,
  );

  factory DataApiResponse.fromError({
    required bool success,
    required int statusCode,
    required String code,
    required String message,
    required ErrorResponse? error,
  }) => DataApiResponse(
    success: success,
    statusCode: statusCode,
    code: code,
    message: message,
    data: null,
    error: error,
  );
}

class ErrorResponse {
  final String message;
  final String details;

  ErrorResponse({required this.message, required this.details});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    message: json['message'] ?? '',
    details: json['details'] ?? '',
  );
}
