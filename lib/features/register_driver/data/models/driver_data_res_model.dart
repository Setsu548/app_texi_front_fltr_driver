import 'dart:convert';

class DriverDataResModel {
  final String uuid;
  final String phoneNumber;
  final bool isVerified;

  DriverDataResModel({
    required this.uuid,
    required this.phoneNumber,
    required this.isVerified,
  });

  factory DriverDataResModel.fromJson(Map<String, dynamic> json) =>
      DriverDataResModel(
        uuid: json['uuid'] ?? '',
        phoneNumber: json['phone_number'] ?? '',
        isVerified: json['is_verified'] ?? false,
      );

  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'phone_number': phoneNumber,
    'is_verified': isVerified,
  };

  factory DriverDataResModel.fromRawJson(String str) =>
      DriverDataResModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
}
