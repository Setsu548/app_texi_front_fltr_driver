import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_image_model.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_image_saving.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_model.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_res_model.dart';
import 'package:texi/features/register_vehicle/data/register_vehicles_paths.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_image_entity.dart';
import 'package:texi/features/register_vehicle/domain/repo/register_vehicle_repo.dart';

class RegisterVehicleRepoImp implements RegisterVehicleRepo {
  final Dio _dio;
  RegisterVehicleRepoImp(this._dio);
  @override
  Future<DataApiResponse<VehicleResModel?>> registerVehicle(
    VehicleEntity vehicle,
    String token,
  ) async {
    final vehicleModel = VehicleModel.fromEntity(vehicle);
    final response = await _dio.post(
      registerVehiclePath,
      data: vehicleModel.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    final dataRes = DataApiResponse<Map<String, dynamic>?>.fromJson(
      response.data,
    );
    if (dataRes.success) {
      return DataApiResponse<VehicleResModel?>(
        success: dataRes.success,
        statusCode: dataRes.statusCode,
        code: dataRes.code,
        message: dataRes.message,
        data: VehicleResModel.fromJson(dataRes.data!),
        error: null,
      );
    } else {
      return DataApiResponse<VehicleResModel?>.fromError(
        statusCode: dataRes.statusCode,
        code: dataRes.code,
        success: dataRes.success,
        message: dataRes.message,
        error: dataRes.error,
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
      final dataRes = DataApiResponse.fromJson(response.data);
      if (dataRes.success) {
        return DataApiResponse(
          success: dataRes.success,
          statusCode: dataRes.statusCode,
          code: dataRes.code,
          message: dataRes.message,
          data: null,
          error: null,
        );
      } else {
        return DataApiResponse.fromError(
          statusCode: dataRes.statusCode,
          code: dataRes.code,
          success: dataRes.success,
          message: dataRes.message,
          error: dataRes.error,
        );
      }
    } catch (e) {
      return DataApiResponse.fromError(
        statusCode: 500,
        code: '0',
        success: false,
        message: 'Error',
        error: ErrorResponse(message: e.toString(), details: e.toString()),
      );
    }
  }
}
