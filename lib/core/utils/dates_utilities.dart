import 'package:i18n_extension/i18n_extension.dart';

class DatesUtilities {
  static String formatDate(DateTime date) {
    final locale = I18n.locale;
    switch (locale.countryCode) {
      case 'BO':
        return '${date.day}/${date.month}/${date.year}';
      case 'US':
        return '${date.month}/${date.day}/${date.year}';
      default:
        return '${date.month}/${date.day}/${date.year}';
    }
  }

  static bool isAdult(DateTime birthDate) {
    final now = DateTime.now();
    final age = now.year - birthDate.year;
    return age >= 18;
  }
}
