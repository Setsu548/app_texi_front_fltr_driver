class DriverInfoEntity {
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String profilePictureUrl;
  final String address;
  final String country;
  final String city;
  final String locality;
  final String gender;
  final DateTime birthDate;

  DriverInfoEntity({
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.profilePictureUrl,
    required this.address,
    required this.country,
    required this.city,
    required this.locality,
    required this.gender,
    required this.birthDate,
  });
}
