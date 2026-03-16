import 'package:texi_driver/features/auth/data/models/device_info_model.dart';

class AuthEntity {
  final String phone;
  final String password;
  final String brand;
  final String ip;
  final String model;
  final String os;

  AuthEntity({
    required this.phone,
    required this.password,
    required this.brand,
    required this.ip,
    required this.model,
    required this.os,
  });

  factory AuthEntity.fromRequest(
    DeviceInfoModel device,
    String phone,
    String password,
  ) {
    return AuthEntity(
      phone: phone,
      password: password,
      brand: device.brand,
      ip: device.ip,
      model: device.model,
      os: device.os,
    );
  }
}
