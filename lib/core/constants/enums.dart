import 'package:texi/core/lang/extension_lang.dart';

enum Gender {
  male,
  female;

  String get genders {
    switch (this) {
      case Gender.male:
        return maleI.i18n;
      case Gender.female:
        return femaleI.i18n;
    }
  }

  String get genderToSave {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
    }
  }
}

enum LicenseCategory {
  a,
  b,
  c,
  m,
  p,
  t;

  String get licenseCategory {
    switch (this) {
      case LicenseCategory.a:
        return 'A';
      case LicenseCategory.b:
        return 'B';
      case LicenseCategory.c:
        return 'C';
      case LicenseCategory.m:
        return 'M';
      case LicenseCategory.p:
        return 'P';
      case LicenseCategory.t:
        return 'T';
    }
  }
}
