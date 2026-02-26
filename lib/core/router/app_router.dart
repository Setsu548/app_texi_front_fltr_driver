import 'package:go_router/go_router.dart';
import 'package:texi/features/auth/presentation/pages/auth_page.dart';
import 'package:texi/features/register_driver/presentation/pages/driver_confirmation_page.dart';
import 'package:texi/features/register_driver/presentation/pages/driver_identity_page.dart';
import 'package:texi/features/register_driver/presentation/pages/driver_license_page.dart';
import 'package:texi/features/register_driver/presentation/pages/register_home_page.dart';
import 'package:texi/features/register_driver/presentation/pages/driver_form_page.dart';
import 'package:texi/features/register_vehicle/presentation/pages/register_vehicle_home_page.dart';

class AppRouter {
  AppRouter._();

  static final String initialLocation = '/';
  static final String registerHomeLocation = '/registerHome';
  static final String registerPersonalInfoLocation = 'personalInfo';
  static final String registerIdentityLocation = 'identity';
  static final String registerLicenseLocation = 'license';
  static final String registerConfirmationLocation = 'confirmation';
  static final String vehicleHome = '/vehicleHome';

  static final routes = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(path: initialLocation, builder: (context, state) => AuthPage()),
      GoRoute(
        path: registerHomeLocation,
        builder: (context, state) => RegisterHomePage(),
        routes: [
          GoRoute(
            path: registerPersonalInfoLocation,
            builder: (context, state) => DriverFormPage(),
          ),
          GoRoute(
            path: registerIdentityLocation,
            builder: (context, state) => DriverIdentityPage(),
          ),
          GoRoute(
            path: registerLicenseLocation,
            builder: (context, state) => DriverLicensePage(),
          ),
          GoRoute(
            path: registerConfirmationLocation,
            builder: (context, state) => DriverConfirmationPage(),
          ),
        ],
      ),
      GoRoute(
        path: vehicleHome,
        builder: (context, state) => RegisterVehicleHomePage(),
      ),
    ],
  );
}
