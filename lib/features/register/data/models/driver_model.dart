import 'package:texi/features/register/domain/entities/driver_entity.dart';

class DriverModel extends DriverEntity {
  DriverModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required super.password,
    /* required super.province, */
    /* required super.city, */
    required super.gender,
    required super.birthDate,
    required super.profession,
    required super.localityId,
  });

  factory DriverModel.fromEntity(DriverEntity entity) {
    return DriverModel(
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      address: entity.address,
      password: entity.password,
      /* province: entity.province, */
      /* city: entity.city, */
      gender: entity.gender,
      birthDate: entity.birthDate,
      profession: entity.profession,
      localityId: entity.localityId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'password': password,
      /* 'province': province, */
      /* 'city': city, */
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'profession': profession,
      'localityId': localityId,
    };
  }

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      password: json['password'],
      /* province: json['province'], */
      /* city: json['city'], */
      gender: json['gender'],
      birthDate: json['birthDate'],
      profession: json['profession'],
      localityId: json['localityId'],
    );
  }
}
