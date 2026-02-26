import 'dart:convert';

class LoginDataModel {
  final String token;
  final String status;

  LoginDataModel({required this.token, required this.status});

  factory LoginDataModel.fromJson(Map<String, dynamic> json) {
    return LoginDataModel(token: json['token'], status: json['status']);
  }

  Map<String, dynamic> toJson() => {'token': token, 'status': status};

  String toRawJson() => json.encode(toJson());

  static Future<LoginDataModel?> fromRawJson(String value) async {
    return LoginDataModel.fromJson(json.decode(value));
  }
}
