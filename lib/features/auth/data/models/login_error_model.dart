class LoginErrorModel {
  final String message;
  final String details;

  LoginErrorModel({required this.message, required this.details});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) {
    return LoginErrorModel(message: json['message'], details: json['details']);
  }
}
