import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/auth/data/models/login_data_model.dart';
import 'package:texi/features/auth/domain/entities/auth_entity.dart';

abstract class AuthRepo {
  Future<DataApiResponse<LoginDataModel>> login(AuthEntity authEntity);
  Future<bool?> hasVehicle();
}
