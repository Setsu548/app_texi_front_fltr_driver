import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/trips_driver/data/repo_impl/trip_repo_impl.dart';

class TripStatesServices {
  static void arriveState(String tripId) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    final dio = Dio(BaseOptions(headers: {'Authorization': 'Bearer $token'}));
    await TripRepoImpl().arriveState(tripId, dio);
  }

  static void startTrip(String tripId) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    final dio = Dio(BaseOptions(headers: {'Authorization': 'Bearer $token'}));
    await TripRepoImpl().startTrip(tripId, dio);
  }

  static void finishTrip(String tripId) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    final dio = Dio(BaseOptions(headers: {'Authorization': 'Bearer $token'}));
    await TripRepoImpl().finishTrip(tripId, dio);
  }
}
