import 'package:texi_driver/features/register_driver/domain/entities/driver_info_entity.dart';

class DriverInfoModel extends DriverInfoEntity {
  DriverInfoModel({
    required super.email,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.address,
    required super.profilePictureUrl,
    required super.city,
    required super.locality,
    required super.country,
    required super.gender,
    required super.birthDate,
  });

  DriverInfoEntity toEntity() {
    return DriverInfoEntity(
      email: email,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      profilePictureUrl: profilePictureUrl,
      address: address,
      country: country,
      city: city,
      locality: locality,
      gender: gender,
      birthDate: birthDate,
    );
  }

  factory DriverInfoModel.fromJson(Map<String, dynamic> json) {
    return DriverInfoModel(
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      profilePictureUrl: json['profile_picture_url'],
      city: json['city'],
      locality: json['locality'],
      country: json['country'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birth_date']),
    );
  }
}
