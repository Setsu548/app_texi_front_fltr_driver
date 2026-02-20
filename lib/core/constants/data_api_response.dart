class DataApiResponse<T> {
  final bool success;
  final int statusCode;
  final String code;
  final String message;
  final T? data;

  DataApiResponse({
    required this.success,
    required this.statusCode,
    required this.code,
    required this.message,
    required this.data,
  });

  factory DataApiResponse.fromJson(Map<String, dynamic> json) =>
      DataApiResponse(
        success: json['success'] ?? false,
        statusCode: json['status_code'] ?? 0,
        code: json['code'] ?? '',
        message: json['message'] ?? '',
        data: json['data'] as T,
      );

  factory DataApiResponse.fromError({
    required bool success,
    required int statusCode,
    required String code,
    required String message,
    required T? data,
  }) => DataApiResponse(
    success: success,
    statusCode: statusCode,
    code: code,
    message: message,
    data: data,
  );
}
