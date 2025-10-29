// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PersonalInfoModel {
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String profession;
  final String country;
  final String city;
  final String province;
  final String? gender;
  final String? birthDate;
  PersonalInfoModel({
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.profession,
    required this.country,
    required this.city,
    required this.province,
    this.gender,
    this.birthDate,
  });

  PersonalInfoModel copyWith({
    String? phoneNumber,
    String? password,
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? profession,
    String? country,
    String? city,
    String? province,
    String? gender,
    String? birthDate,
  }) {
    return PersonalInfoModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      address: address ?? this.address,
      profession: profession ?? this.profession,
      country: country ?? this.country,
      city: city ?? this.city,
      province: province ?? this.province,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone_number': phoneNumber,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'profession': profession,
      'country': country,
      'city': city,
      'province': province,
      'gender': gender,
      'birth_date': birthDate,
    };
  }

  factory PersonalInfoModel.fromMap(Map<String, dynamic> map) {
    return PersonalInfoModel(
      phoneNumber: map['phone_number'] as String,
      password: map['password'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      profession: map['profession'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      province: map['province'] as String,
      gender: map['gender'] != null ? map['gender'] as String : null,
      birthDate: map['birth_date'] != null ? map['birth_date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfoModel.fromJson(String source) => PersonalInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PersonalInfoModel(phoneNumber: $phoneNumber, password: $password, firstName: $firstName, lastName: $lastName, email: $email, address: $address, profession: $profession, country: $country, city: $city, province: $province, gender: $gender, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant PersonalInfoModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.phoneNumber == phoneNumber &&
      other.password == password &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.address == address &&
      other.profession == profession &&
      other.country == country &&
      other.city == city &&
      other.province == province &&
      other.gender == gender &&
      other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return phoneNumber.hashCode ^
      password.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      address.hashCode ^
      profession.hashCode ^
      country.hashCode ^
      city.hashCode ^
      province.hashCode ^
      gender.hashCode ^
      birthDate.hashCode;
  }
}

class PersonalInfoResponse {
  final String uuid;
  final String phoneNumber;
  final bool isVerified;
  PersonalInfoResponse({
    required this.uuid,
    required this.phoneNumber,
    required this.isVerified,
  });


  PersonalInfoResponse copyWith({
    String? uuid,
    String? phoneNumber,
    bool? isVerified,
  }) {
    return PersonalInfoResponse(
      uuid: uuid ?? this.uuid,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'phoneNumber': phoneNumber,
      'isVerified': isVerified,
    };
  }

  factory PersonalInfoResponse.fromMap(Map<String, dynamic> map) {
    return PersonalInfoResponse(
      uuid: map['uuid'] as String,
      phoneNumber: map['phoneNumber'] as String,
      isVerified: map['isVerified'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonalInfoResponse.fromJson(String source) => PersonalInfoResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PersonalInfoResponse(uuid: $uuid, phoneNumber: $phoneNumber, isVerified: $isVerified)';

  @override
  bool operator ==(covariant PersonalInfoResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.phoneNumber == phoneNumber &&
      other.isVerified == isVerified;
  }

  @override
  int get hashCode => uuid.hashCode ^ phoneNumber.hashCode ^ isVerified.hashCode;
}

