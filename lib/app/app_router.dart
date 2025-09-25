import 'package:app_texi_fltr_driver/dashboard/screen/driver_auth_screen.dart';
import 'package:app_texi_fltr_driver/dashboard/screen/driver_dashboard_screen.dart';
import 'package:app_texi_fltr_driver/dashboard/screen/driver_dropoff_screen.dart';
import 'package:app_texi_fltr_driver/dashboard/screen/driver_pickup_screen.dart';
import 'package:app_texi_fltr_driver/dashboard/screen/travel_details_screen.dart';
import 'package:app_texi_fltr_driver/dashboard/screen/travel_rating_screen.dart';
import 'package:app_texi_fltr_driver/navigation/screen/bonuses_screen.dart';
import 'package:app_texi_fltr_driver/navigation/screen/earnings_screen.dart';
import 'package:app_texi_fltr_driver/navigation/screen/profile_screen.dart';
import 'package:app_texi_fltr_driver/navigation/screen/travel_history_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/driver_license_verification_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/identity_verification_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/personal_info_form_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/registration_confirmation_person_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/registration_confirmation_vehicle_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_found_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_info_form_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_photo_registration_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_plate_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_search_result_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/vehicle_selection_screen.dart';
import 'package:app_texi_fltr_driver/security/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../security/screen/security_login_screen.dart';
import 'screen/app_demo_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final _rootNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage getBuilder(GoRouterState state, {required Widget screen}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/security/login',
  // redirect: (context, state) async {
  // },
  routes: [
    GoRoute(
      path: '/demo',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const AppDemoScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/login',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const SecurityLoginScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/welcome',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const WelcomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/personal_info_form',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const PersonalInfoFormScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/identity_verification',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const IdentityVerificationScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/driver_license_verification',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverLicenseVerificationScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/registration_confirmation_person',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const RegistrationConfirmationPersonScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_selection',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehicleSelectionScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_plate',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehiclePlateScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_found',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehicleFoundScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_search_result',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehicleSearchResultScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_info_form',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehicleInfoFormScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/vehicle_photo_registration',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const VehiclePhotoRegistrationScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/registration_confirmation_vehicle',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const RegistrationConfirmationVehicleScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/driver_dashboard',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverDashboardScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/travel_details',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelDetailsScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/driver_auth',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverAuthScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/driver_pickup',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverPickupScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/driver_dropoff',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const DriverDropoffScreen(),
        );
      },
    ),
    GoRoute(
      path: '/dashboard/travel_rating',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelRatingScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/profile',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const ProfileScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/travel_history',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const TravelHistoryScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/earnings',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const EarningsScreen(),
        );
      },
    ),
    GoRoute(
      path: '/navigation/bonuses',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const BonusesScreen(),
        );
      },
    ),
  ]
);

extension GoRouterExtension on GoRouter {
  void popUntil(String location, {Object? extra}) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation != location) {
      if (!canPop()) {
        return;
      }
      pop(extra);
    }
  }
}

extension GoRouterHelper on BuildContext {
  void popUntil(String location, {Object? extra}) => GoRouter.of(this).popUntil(location, extra: extra);
}