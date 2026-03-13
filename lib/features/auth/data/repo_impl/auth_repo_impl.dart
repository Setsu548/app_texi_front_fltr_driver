import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/features/auth/data/auth_endpoints.dart';
import 'package:texi/features/auth/data/models/auth_model.dart';
import 'package:texi/features/auth/data/models/login_data_model.dart';
import 'package:texi/features/auth/domain/entities/auth_entity.dart';
import 'package:texi/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final Dio _dio;
  AuthRepoImpl(this._dio);

  @override
  Future<DataApiResponse<LoginDataModel>> login(AuthEntity authEntity) async {
    final authModel = AuthModel.fromEntity(authEntity);
    try {
      final response = await _dio.post(loginPath, data: authModel.toJson());
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<LoginDataModel>.fromSuccess(
            response.data,
            (json) => LoginDataModel.fromJson(json),
          );
        case 201:
          return DataApiResponse.fromSuccess(response.data, null);
        case 400:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'],
            message: response.data['message'],
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 404:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'],
            message: response.data['message'],
            error: ErrorResponse.fromJson(response.data['error']),
          );
        default:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'],
            message: response.data['message'],
            error: ErrorResponse.fromJson(response.data['error']),
          );
      }
    } on DioException catch (e) {
      return DataApiResponse.fromError(
        success: false,
        statusCode: 500,
        code: 'ERROR',
        message: 'Error al iniciar sesión',
        error: ErrorResponse.fromJson(e.response?.data['error']),
      );
    }
  }

  @override
  Future<bool?> hasVehicle() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    try {
      final token = await storage.getString(StorageKeys.driverToken);
      if (token == null) {
        return null;
      }
      final response = await _dio.get(
        hasVehiclePath,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      switch (response.statusCode) {
        case 200:
          final vehicles = response.data['data'] as List;
          if (vehicles.isEmpty) {
            return false;
          }
          return true;
        default:
          return null;
      }
    } on DioException catch (e) {
      throw (e.response?.data['error']['details']);
    }
  }
}
