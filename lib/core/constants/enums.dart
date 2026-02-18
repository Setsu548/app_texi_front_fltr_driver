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
}
