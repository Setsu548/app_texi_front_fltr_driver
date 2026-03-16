import 'package:go_router/go_router.dart';
import 'package:texi_driver/core/router/transitions_helper.dart';
import 'package:texi_driver/core/widgets/offline_page.dart';
import 'package:texi_driver/core/widgets/offline_position_page.dart';
import 'package:texi_driver/features/auth/presentation/pages/auth_page.dart';
import 'package:texi_driver/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:texi_driver/features/dashboard/presentation/pages/driver_profile.dart';
import 'package:texi_driver/features/trips_driver/presentation/pages/road_to_origin_page.dart';
import 'package:texi_driver/features/trips_driver/presentation/pages/trip_passenger_offers_page.dart';
import 'package:texi_driver/features/dashboard/presentation/pages/vehicle_list_page.dart';
import 'package:texi_driver/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi_driver/features/register_driver/presentation/pages/confirmation_driver_data.dart';
import 'package:texi_driver/features/register_driver/presentation/pages/driver_identity_page.dart';
import 'package:texi_driver/features/register_driver/presentation/pages/driver_license_page.dart';
import 'package:texi_driver/features/register_driver/presentation/pages/register_home_page.dart';
import 'package:texi_driver/features/register_driver/presentation/pages/driver_form_page.dart';
import 'package:texi_driver/features/register_vehicle/presentation/pages/register_vehicle_home_page.dart';
import 'package:texi_driver/features/register_vehicle/presentation/pages/register_vehicle_info_page.dart';
import 'package:texi_driver/features/register_vehicle/presentation/pages/register_vehicle_photos_page.dart';

class AppRouter {
  AppRouter._();

  static final String initialLocation = '/';
  static final String registerHomeLocation = '/registerHome';
  static final String registerPersonalInfoLocation = 'personalInfo';
  static final String confirmationDriverDataLocation = 'confirmationDriverData';
  static final String registerIdentityLocation = 'identity';
  static final String registerLicenseLocation = 'license';
  static final String vehicleRegisterHome = '/vehicleRegisterHome';
  static final String vehicleRegisterInfoLocation = 'vehicleRegisterInfo';
  static final String vehicleRegisterPhotosLocation = 'vehicleRegisterPhotos';
  static final String vehicleListLocation = '/vehicleList';
  static final String dashboardLocation = '/dashboard';
  static final String driverProfileLocation = '/driverProfile';
  static final String offlineLocation = '/offline';
  static final String offlinePositionLocation = '/offlinePosition';
  static final String tripPassengerOffersLocation = '/tripPassengerOffers';
  static final String roadToOriginLocation = 'roadToOrigin';

  static final routes = GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: initialLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.fadeTransition(state, AuthPage()),
      ),
      GoRoute(
        path: registerHomeLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.slideUpTransition(state, RegisterHomePage()),
        routes: [
          GoRoute(
            path: registerPersonalInfoLocation,
            pageBuilder: (context, state) =>
                TransitionsHelper.slideTransition(state, DriverFormPage()),
          ),
          GoRoute(
            path: confirmationDriverDataLocation,
            pageBuilder: (context, state) => TransitionsHelper.slideTransition(
              state,
              ConfirmationDriverData(driver: state.extra as DriverEntity),
            ),
          ),
          GoRoute(
            path: registerIdentityLocation,
            pageBuilder: (context, state) =>
                TransitionsHelper.slideTransition(state, DriverIdentityPage()),
          ),
          GoRoute(
            path: registerLicenseLocation,
            pageBuilder: (context, state) =>
                TransitionsHelper.slideTransition(state, DriverLicensePage()),
          ),
        ],
      ),
      GoRoute(
        path: vehicleListLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.fadeTransition(state, VehicleListPage()),
      ),
      GoRoute(
        path: dashboardLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.fadeTransition(state, DashboardPage()),
        routes: [
          GoRoute(
            path: driverProfileLocation,
            pageBuilder: (context, state) =>
                TransitionsHelper.slideUpTransition(state, DriverProfile()),
          ),
        ],
      ),
      GoRoute(
        path: tripPassengerOffersLocation,
        pageBuilder: (context, state) => TransitionsHelper.slideUpTransition(
          state,
          const TripPassengerOffersPage(),
        ),
        routes: [
          GoRoute(
            path: roadToOriginLocation,
            pageBuilder: (context, state) =>
                TransitionsHelper.slideUpTransition(
                  state,
                  RoadToOriginPage(tripId: state.extra as String),
                ),
          ),
        ],
      ),
      GoRoute(
        path: vehicleRegisterHome,
        pageBuilder: (context, state) => TransitionsHelper.slideUpTransition(
          state,
          RegisterVehicleHomePage(),
        ),
        routes: [
          GoRoute(
            path: vehicleRegisterInfoLocation,
            pageBuilder: (context, state) => TransitionsHelper.slideTransition(
              state,
              RegisterVehicleInfoPage(),
            ),
          ),
          GoRoute(
            path: vehicleRegisterPhotosLocation,
            pageBuilder: (context, state) => TransitionsHelper.slideTransition(
              state,
              RegisterVehiclePhotosPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: offlineLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.fadeTransition(state, OfflinePage()),
      ),
      GoRoute(
        path: offlinePositionLocation,
        pageBuilder: (context, state) =>
            TransitionsHelper.fadeTransition(state, OfflinePositionPage()),
      ),
    ],
  );
}
