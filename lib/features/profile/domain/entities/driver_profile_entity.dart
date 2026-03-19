class DriverProfileEntity {
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

  DriverProfileEntity({
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

  DriverProfileEntity copyWith({
    String? address,
    String? birthDate,
    String? email,
    String? firstName,
    String? gender,
    String? lastName,
    String? locality,
    String? phoneNumber,
    String? pictureProfile,
    String? uuid,
  }) {
    return DriverProfileEntity(
      address: address ?? this.address,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      gender: gender ?? this.gender,
      lastName: lastName ?? this.lastName,
      locality: locality ?? this.locality,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pictureProfile: pictureProfile ?? this.pictureProfile,
      uuid: uuid ?? this.uuid,
    );
  }
}