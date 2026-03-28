import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/register_vehicle/data/model/vehicle_image_model.dart';
import 'package:texi_driver/features/register_vehicle/data/model/vehicle_image_saving.dart';
import 'package:texi_driver/features/register_vehicle/data/model/vehicle_model.dart';
import 'package:texi_driver/features/register_vehicle/data/model/vehicle_res_model.dart';
import 'package:texi_driver/features/register_vehicle/data/register_vehicles_paths.dart';
import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_image_entity.dart';
import 'package:texi_driver/features/register_vehicle/domain/repo/register_vehicle_repo.dart';

class RegisterVehicleRepoImp implements RegisterVehicleRepo {
  final Dio _dio;
  RegisterVehicleRepoImp(this._dio);
  @override
  Future<DataApiResponse<VehicleResModel?>> registerVehicle(
    VehicleEntity vehicle,
    String token,
  ) async {
    final vehicleModel = VehicleModel.fromEntity(vehicle);
    try {
      final response = await _dio.post(
        registerVehiclePath,
        data: vehicleModel.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      if (response.statusCode == 200) {
        return DataApiResponse<VehicleResModel?>.fromSuccess(
          response.data,
          (json) => VehicleResModel.fromJson(json),
        );
      }
      return DataApiResponse<VehicleResModel?>.fromError(
        success: false,
        statusCode: response.statusCode ?? 500,
        code: response.data['code'] ?? '0',
        message: response.data['message'] ?? 'Error',
        error: ErrorResponse.fromJson(response.data['error']),
      );
    } on DioException catch (e) {
      return DataApiResponse<VehicleResModel?>.fromError(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        code: e.response?.data['code'] ?? '0',
        message: e.response?.data['message'] ?? 'Error',
        error: ErrorResponse.fromJson(e.response?.data['error']),
      );
    }
  }

  @override
  Future<DataApiResponse> registerVehicleImages(
    List<VehicleImageEntity> vehicleImages,
  ) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final vehicleId = await storage.getString(StorageKeys.vehicleRegister);
    try {
      final vehiclesImagesModel = VehicleImageSaving(
        carId: vehicleId!,
        cars: vehicleImages
            .map((e) => VehicleImageModel.fromEntity(e))
            .toList(),
      );
      final data = vehiclesImagesModel.toJson();
      final token = await GetIt.instance<AuthSecureStorageService>().getString(
        StorageKeys.driverToken,
      );
      final response = await _dio.post(
        registerVehicleImagesPath,
        data: data,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      switch (response.statusCode) {
        case 200:
          return DataApiResponse(
            success: true,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            data: null,
            error: null,
          );
        case 400:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 404:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 500:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 502:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        default:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
      }
    } on DioException catch (e) {
      return DataApiResponse.fromError(
        statusCode: e.response?.statusCode ?? 500,
        code: e.response?.data['code'] ?? '0',
        success: false,
        message: e.response?.data['message'] ?? 'Error',
        error: ErrorResponse.fromJson(e.response?.data['error']),
      );
    }
  }
}
