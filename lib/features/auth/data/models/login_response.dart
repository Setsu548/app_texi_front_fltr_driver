class LoginResponse {
  final String code;
  final String data;
  final String error;
  final String message;
  final int statusCode;
  final bool success;

  LoginResponse({
    required this.code,
    required this.data,
    required this.error,
    required this.message,
    required this.statusCode,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      code: json['code'],
      data: json['data'],
      error: json['error'],
      message: json['message'],
      statusCode: json['status_code'],
      success: json['success'],
    );
  }
}
