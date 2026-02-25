import 'package:dio/dio.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi/features/register_driver/data/models/driver_model.dart';
import 'package:texi/features/register_driver/data/models/geo_data_res_model.dart';
import 'package:texi/features/register_driver/data/models/identification_model.dart';
import 'package:texi/features/register_driver/data/register_endpoints.dart';
import 'package:texi/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi/features/register_driver/domain/entities/identification_entity.dart';
import 'package:texi/features/register_driver/domain/repo/driver_register_repo.dart';

class DriverRegisterRepoImpl implements DriverRegisterRepo {
  final Dio _dio;
  DriverRegisterRepoImpl(this._dio);

  @override
  Future<DriverDataResModel> registerDriver(DriverEntity driver) async {
    try {
      final response = await _dio.post(
        registerDriverEndpoint,
        data: DriverModel.fromEntity(driver).toJson(),
      );
      if (response.statusCode != 200) {
        return DriverDataResModel.fromError(response.data);
      }
      return DriverDataResModel.fromJson(response.data);
    } catch (e) {
      return DriverDataResModel.fromErrorCatch(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: e.toString(),
        data: null,
      );
    }
  }

  @override
  Future<GeoDataResModel> getDepartments(String country) async {
    try {
      final response = await _dio.get('$departmentsEndpoint$country');
      if (response.statusCode != 200) {
        return GeoDataResModel.fromError(
          response.data,
          response.statusCode!,
          response.data['details'] as String,
        );
      }
      final resModel = GeoDataResModel.fromJson(response.data);
      return resModel;
    } catch (e) {
      return GeoDataResModel.fromError({}, 500, e.toString());
    }
  }

  @override
  Future<DataApiResponse<String?>> registerDriverIdentification(
    IdentificationEntity identification,
  ) async {
    final IdentificationModel identificationModel =
        IdentificationModel.fromEntity(identification);
    try {
      final response = await _dio.post(
        registerDriverIdentificationEndpoint,
        data: identificationModel.toJson(),
      );
      if (response.statusCode != 200) {
        return DataApiResponse.fromError(
          success: false,
          statusCode: response.statusCode!,
          code: response.data['code'] ?? '',
          message: response.data['message'] ?? '',
          error: ErrorResponse.fromJson(response.data['error']),
        );
      }
      return DataApiResponse.fromJson(response.data);
    } catch (e) {
      return DataApiResponse.fromError(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: e.toString(),
        error: ErrorResponse(message: e.toString(), details: e.toString()),
      );
    }
  }

  @override
  Future<DataApiResponse<bool>> confirmDataRegister(String uuid) async {
    try {
      final resJson = await _dio.put(confirmRegister, data: {'uuid': uuid});
      if (resJson.statusCode != 200) {
        return DataApiResponse<bool>.fromError(
          success: false,
          statusCode: resJson.statusCode!,
          code: resJson.data['code'] ?? '',
          message: resJson.data['message'] ?? '',
          error: ErrorResponse.fromJson(resJson.data['error']),
        );
      }
      return DataApiResponse<bool>(
        success: true,
        statusCode: resJson.statusCode!,
        code: resJson.data['code'] ?? '',
        message: resJson.data['message'] ?? '',
        data: true,
        error: null,
      );
    } catch (e) {
      return DataApiResponse<bool>.fromError(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: e.toString(),
        error: ErrorResponse(message: e.toString(), details: e.toString()),
      );
    }
  }
}
