import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.routes,
          theme: AppTheme.lightTheme,
          locale: I18n.locale,
          localizationsDelegates: I18n.localizationsDelegates,
          supportedLocales: I18n.supportedLocales,
        );
      },
    );
  }
}
