import 'package:texi/core/utils/dates_utilities.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';

class DriverModel extends DriverEntity {
  DriverModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.address,
    required super.password,
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
      gender: entity.gender,
      birthDate: entity.birthDate,
      profession: entity.profession,
      localityId: entity.localityId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_number': phoneNumber,
      'address': address,
      'password': password,
      'gender': gender,
      'birth_date': DatesUtilities.dateToSave(birthDate),
      'profession': profession,
      'locality_id': localityId,
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
      gender: json['gender'],
      birthDate: DateTime.parse(json['birthDate']),
      profession: json['profession'],
      localityId: json['localityId'],
    );
  }
}
