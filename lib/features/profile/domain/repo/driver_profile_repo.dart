import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/profile/domain/entities/driver_profile_entity.dart';

abstract class DriverProfileRepo {
  Future<DataApiResponse<DriverProfileEntity>> getProfile(Dio dio);
  Future<DataApiResponse<DriverProfileEntity>> updateProfile(
    DriverProfileEntity profile,
    Dio dio,
  );
}
