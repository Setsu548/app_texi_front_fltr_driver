import 'package:texi_driver/features/auth/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.phone,
    required super.password,
    required super.brand,
    required super.ip,
    required super.model,
    required super.os,
  });

  factory AuthModel.fromEntity(AuthEntity entity) {
    return AuthModel(
      phone: entity.phone,
      password: entity.password,
      brand: entity.brand,
      ip: entity.ip,
      model: entity.model,
      os: entity.os,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': phone,
      'password': password,
      'brand': brand,
      'ip': ip,
      'model': model,
      'os': os,
    };
  }
}
