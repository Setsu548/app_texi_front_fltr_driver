import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:texi/core/lang/delegates_lang.dart';
import 'package:texi/core/lang/supported_lang.dart';
import 'package:texi/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    I18n(
      localizationsDelegates: localizationsDelegates,
      initialLocale: await I18n.loadLocale(),
      autoSaveLocale: true,
      supportedLocales: suportedLang,
      child: ProviderScope(child: MainApp()),
    ),
  );
}
