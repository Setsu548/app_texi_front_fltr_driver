import 'package:dio/dio.dart';
import 'package:texi/core/constants/data_api_response.dart';
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
      if (response.statusCode != 200) {
        return DataApiResponse.fromError(
          success: false,
          statusCode: response.statusCode!,
          code: response.data['code'],
          message: response.data['message'],
          error: response.data['error'],
        );
      }
      final loginModel = LoginDataModel.fromJson(response.data['data']);
      return DataApiResponse(
        success: true,
        statusCode: response.statusCode!,
        code: response.data['code'],
        message: response.data['message'],
        data: loginModel,
        error: null,
      );
    } catch (e) {
      return DataApiResponse.fromError(
        success: false,
        statusCode: 500,
        code: 'ERROR',
        message: 'Error al iniciar sesión',
        error: ErrorResponse(message: e.toString(), details: e.toString()),
      );
    }
  }
}
