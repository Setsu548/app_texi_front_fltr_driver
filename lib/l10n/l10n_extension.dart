import 'package:app_texi_fltr_driver/l10n/generated/l10n.dart';
import 'package:flutter/widgets.dart';


extension BuildContextExtensions on BuildContext {
  AppLocalizations get intl => AppLocalizations.of(this);
}