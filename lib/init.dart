import 'package:app_texi_driver/core/lang/suported_lang.dart';
import 'package:app_texi_driver/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ProviderScope(
      child: I18n(
        initialLocale: await I18n.loadLocale(),
        autoSaveLocale: true,
        supportedLocales: suportedLang,
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MainApp();
          },
        ),
      ),
    ),
  );
}
