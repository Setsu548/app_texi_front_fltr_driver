import 'dart:convert';

class LoginDataModel {
  final String token;
  final String refreshToken;
  final String status;

  LoginDataModel({
    required this.token,
    required this.status,
    required this.refreshToken,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(
      token: json['token'],
      status: json['status'],
      refreshToken: json['refresh_token'],
    );
  }

  Map<String, dynamic> toJson() => {
    'token': token,
    'status': status,
    'refresh_token': refreshToken,
  };

  String toRawJson() => json.encode(toJson());

  static Future<LoginDataModel?> fromRawJson(String value) async {
    return LoginDataModel.fromJson(json.decode(value));
  }
}
