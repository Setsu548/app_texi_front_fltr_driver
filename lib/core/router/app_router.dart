//import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/auth/presentation/pages/auth_page.dart';
import 'package:texi/features/register/presentation/pages/driver_confirmation_page.dart';
//import 'package:texi/features/register/domain/entities/driver_entity.dart';
import 'package:texi/features/register/presentation/pages/driver_identity_page.dart';
import 'package:texi/features/register/presentation/pages/driver_license_page.dart';
import 'package:texi/features/register/presentation/pages/register_home_page.dart';
import 'package:texi/features/register/presentation/pages/driver_form_page.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => AuthPage()),
      GoRoute(
        path: '/registerHome',
        builder: (context, state) => RegisterHomePage(),
        routes: [
          GoRoute(
            path: 'personalInfo',
            builder: (context, state) => DriverFormPage(),
          ),
          GoRoute(
            path: 'identity',
            builder: (context, state) {
              return DriverIdentityPage();
              /* final driver = state.extra;
              if (driver is DriverEntity) {
                return DriverIdentityPage();
              }
              return Scaffold(body: Center(child: Text(driverNotFound.i18n))); */
            },
          ),
          GoRoute(
            path: 'license',
            builder: (context, state) {
              return DriverLicensePage();
            },
          ),
          GoRoute(
            path: 'confirmation',
            builder: (context, state) {
              return DriverConfirmationPage();
            },
          ),
        ],
      ),
    ],
  );
}
