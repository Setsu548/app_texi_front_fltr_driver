import 'package:texi_driver/features/profile/domain/entities/driver_profile_entity.dart';

class DriverProfileModel {
  final String address;
  final String birthDate;
  final String email;
  final String firstName;
  final String gender;
  final String lastName;
  final String locality;
  final String phoneNumber;
  final String? pictureProfile;
  final String uuid;

  DriverProfileModel({
    required this.address,
    required this.birthDate,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.locality,
    required this.phoneNumber,
    required this.pictureProfile,
    required this.uuid,
  });

  factory DriverProfileModel.fromJson(Map<String, dynamic> json) {
    return DriverProfileModel(
      address: json['address'] ?? '',
      birthDate: json['birth_date'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      gender: json['gender'] ?? '',
      lastName: json['last_name'] ?? '',
      locality: json['locality'],
      phoneNumber: json['phone_number'] ?? '',
      pictureProfile: json['picture_profile'],
      uuid: json['uuid'] ?? '',
    );
  }

  DriverProfileEntity toEntity() {
    return DriverProfileEntity(
      address: address,
      birthDate: birthDate,
      email: email,
      firstName: firstName,
      gender: gender,
      lastName: lastName,
      locality: locality,
      phoneNumber: phoneNumber,
      pictureProfile: pictureProfile,
      uuid: uuid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'birth_date': birthDate,
      'email': email,
      'first_name': firstName,
      'gender': gender,
      'last_name': lastName,
      'locality': locality,
      'phone_number': phoneNumber,
      'picture_profile': pictureProfile,
      'uuid': uuid,
    };
  }
}
