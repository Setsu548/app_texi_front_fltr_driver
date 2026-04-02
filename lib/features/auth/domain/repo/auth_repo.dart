import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/auth/data/models/login_data_model.dart';
import 'package:texi_driver/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<DataApiResponse<LoginDataModel>> login(AuthEntity authEntity);
  Future<bool?> hasVehicle();
  Future<DataApiResponse<LoginDataModel>> refreshToken(Dio dioRefresh);
  Future<DataApiResponse<void>> logout();
}
