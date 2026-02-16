import 'package:app_texi_driver/core/theme/app_theme.dart';
import 'package:app_texi_driver/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: I18n.locale,
      localizationsDelegates: I18n.localizationsDelegates,
      supportedLocales: I18n.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: LoginPage(),
    );
  }
}
