import 'package:dio/dio.dart';
import 'package:texi/features/register/data/models/driver_data_res_model.dart';
import 'package:texi/features/register/data/models/driver_model.dart';
import 'package:texi/features/register/data/register_endpoints.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';
import 'package:texi/features/register/domain/repo/driver_register_repo.dart';

class DriverRegisterRepoImpl implements DriverRegisterRepo {
  final dio = Dio();
  @override
  Future<DriverDataResModel> registerDriver(DriverEntity driver) async {
    try {
      final response = await dio.post(
        registerDriverEndpoint,
        data: DriverModel.fromEntity(driver).toJson(),
      );
      if (response.statusCode != 200) {
        return DriverDataResModel.fromError(
          success: false,
          statusCode: response.statusCode!,
          code: 'Fail',
          message: 'Fail',
          data: null,
        );
      }
      return DriverDataResModel.fromJson(response.data);
    } catch (e) {
      return DriverDataResModel.fromError(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: 'Fail',
        data: null,
      );
    }
  }
}
