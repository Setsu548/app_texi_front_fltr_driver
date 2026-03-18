import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:texi_driver/core/lang/delegates_lang.dart';
import 'package:texi_driver/core/lang/supported_lang.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final getIt = GetIt.instance;

  void setupLocator() {
    getIt.registerSingleton<AuthSecureStorageService>(
      AuthSecureStorageService(),
    );
  }

  await dotenv.load(fileName: ".env");
  setupLocator();
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
