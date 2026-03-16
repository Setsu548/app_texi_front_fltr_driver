import 'dart:convert';
import 'package:texi_driver/core/utils/dates_utilities.dart';
import 'package:texi_driver/features/register_driver/domain/entities/driver_entity.dart';

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
    super.profession,
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

  DriverEntity toEntity() {
    return DriverEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
      password: password,
      gender: gender,
      birthDate: birthDate,
      profession: profession,
      localityId: localityId,
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
      'profession': null,
      'locality_id': localityId,
    };
  }

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    return DriverModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      password: json['password'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birth_date']),
      profession: null,
      localityId: json['locality_id'],
    );
  }

  String toRawJson() {
    return jsonEncode(toJson());
  }

  factory DriverModel.fromRawJson(String rawDriverInformation) {
    final json = jsonDecode(rawDriverInformation);
    return DriverModel.fromJson(json);
  }
}
