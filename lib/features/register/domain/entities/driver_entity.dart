class DriverEntity {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String address;
  final String password;
  final String gender;
  final DateTime birthDate;
  final String profession;
  final int localityId;

  DriverEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.password,
    required this.gender,
    required this.birthDate,
    required this.profession,
    required this.localityId,
  });
}
