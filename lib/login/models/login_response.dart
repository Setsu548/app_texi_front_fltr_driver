// lib/data/models/login_response.dart
class LoginResponse {
  final String token;

  LoginResponse({required this.token,});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'] ?? '',
    );
  }
}

class LogoutResponse {
  final String data;

  LogoutResponse({required this.data,});

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      data: json['data'] ?? '',
    );
  }
}
// class User {
//   final int id;
//   final String name;
//   final String email;

//   User({required this.id, required this.name, required this.email});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       email: json['email'] ?? '',
//     );
//   }
// }
