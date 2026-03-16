import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/dashboard/data/dashboard_endpoints.dart';
import 'package:texi_driver/features/dashboard/data/models/dashboard_vehicle_model.dart';
import 'package:texi_driver/features/dashboard/domain/entities/dashboard_vehicle_entity.dart';
import 'package:texi_driver/features/dashboard/domain/repo/dashboar_repo.dart';

class DashboardRepoImpl implements DashboarRepo {
  final Dio _dio;
  DashboardRepoImpl(this._dio);
  @override
  Future<DataApiResponse<List<DashboardVehicleEntity>>> getVehicleList() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    try {
      final token = await storage.getString(StorageKeys.driverToken);
      if (token == null) {
        return DataApiResponse.fromError(
          success: false,
          statusCode: 401,
          code: 'UNAUTHORIZED',
          message: 'No autorizado',
          error: ErrorResponse(
            message: tokenNotFound.i18n,
            details: tokenNotFound.i18n,
          ),
        );
      }
      final response = await _dio.get(
        vehicleListPath,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      final vehiclesJsonList = response.data['data'] as List;
      final vehicleList = vehiclesJsonList
          .map((vehicle) => DashboardVehicleModel.fromJson(vehicle))
          .toList();
      return DataApiResponse(
        success: true,
        statusCode: 200,
        code: 'OK',
        message: 'Vehículos obtenidos correctamente',
        data: vehicleList,
        error: null,
      );
    } catch (e) {
      return DataApiResponse.fromError(
        success: false,
        statusCode: 500,
        code: 'ERROR',
        message: 'Error al obtener los vehículos',
        error: ErrorResponse(message: e.toString(), details: e.toString()),
      );
    }
  }
}
