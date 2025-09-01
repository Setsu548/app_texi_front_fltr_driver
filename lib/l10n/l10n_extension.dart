import 'package:flutter/widgets.dart';
import 'generated/l10n.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this);
}