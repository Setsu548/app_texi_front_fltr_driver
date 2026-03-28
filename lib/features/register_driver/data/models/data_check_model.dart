class EmailChecked {
  final bool emailVerified;

  EmailChecked({required this.emailVerified});

  factory EmailChecked.fromJson(Map<String, dynamic> json) {
    return EmailChecked(emailVerified: json['emailVerified'] ?? false);
  }
}

class PhoneChecked {
  final bool phoneVerified;

  PhoneChecked({required this.phoneVerified});

  factory PhoneChecked.fromJson(Map<String, dynamic> json) {
    return PhoneChecked(phoneVerified: json['phoneVerified'] ?? false);
  }
}
