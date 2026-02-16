import 'package:i18n_extension/i18n_extension.dart';

const loginDescription = 'Plataforma para conductores';

extension Localization on String {
  static const _translations = ConstTranslations('es-BO', {
    loginDescription: {
      'es-BO': 'Plataforma para conductores',
      'en-US': 'Platform for drivers',
      'es-ES': 'Plataforma para conductores',
      'es-MX': 'Plataforma para conductores',
    },
  });

  String get i18n => localize(this, _translations);
}
