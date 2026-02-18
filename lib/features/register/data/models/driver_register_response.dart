class DriverRegisterResponse {
  final bool isVerified;
  final String phoneNumber;
  final String uuid;

  DriverRegisterResponse({
    required this.isVerified,
    required this.phoneNumber,
    required this.uuid,
  });

  factory DriverRegisterResponse.fromJson(Map<String, dynamic> json) =>
      DriverRegisterResponse(
        isVerified: json['is_verified'] ?? false,
        phoneNumber: json['phone_number'] ?? '',
        uuid: json['uuid'] ?? '',
      );
}
