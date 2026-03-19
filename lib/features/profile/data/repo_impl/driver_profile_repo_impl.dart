import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/profile/data/models/driver_profile_model.dart';
import 'package:texi_driver/features/profile/data/profile_endpoints.dart';
import 'package:texi_driver/features/profile/domain/entities/driver_profile_entity.dart';
import 'package:texi_driver/features/profile/domain/repo/driver_profile_repo.dart';

class DriverProfileRepoImpl implements DriverProfileRepo {
  @override
  Future<DataApiResponse<DriverProfileEntity>> getProfile(Dio dio) async {
    try {
      final response = await dio.get(getProfilePath);
      print(response);
      switch (response.statusCode) {
        case 200:
          print(response.data);
          return DataApiResponse<DriverProfileEntity>.fromSuccess(
            response.data,
            (data) => DriverProfileModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message'] ?? 'Error fetching profile');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }

  @override
  Future<DataApiResponse<DriverProfileEntity>> updateProfile(
    DriverProfileEntity profile,
    Dio dio,
  ) async {
    try {
      final response = await dio.patch(
        updateProfilePath,
        data: (profile as DriverProfileModel).toJson(),
      );
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<DriverProfileEntity>.fromSuccess(
            response.data,
            (data) => DriverProfileModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message'] ?? 'Error updating profile');
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message'] ?? 'Network error');
    }
  }
}
