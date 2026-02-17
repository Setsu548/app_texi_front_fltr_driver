import 'package:texi/features/register/domain/entities/driver_entity.dart';

class DriverModel extends DriverEntity {
  DriverModel({
    required super.name,
    required super.lastName,
    required super.email,
    required super.phone,
    required super.address,
    required super.password,
    required super.province,
    required super.city,
    required super.gender,
    required super.birthDate,
    required super.countryCode,
  });

  factory DriverModel.fromEntity(DriverEntity entity) {
    return DriverModel(
      name: entity.name,
      lastName: entity.lastName,
      email: entity.email,
      phone: entity.phone,
      address: entity.address,
      password: entity.password,
      province: entity.province,
      city: entity.city,
      gender: entity.gender,
      birthDate: entity.birthDate,
      countryCode: entity.countryCode,
    );
  }
}
