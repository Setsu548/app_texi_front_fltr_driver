import 'package:dio/dio.dart';
import 'package:texi/features/register/data/models/driver_model.dart';
import 'package:texi/features/register/data/models/driver_register_response.dart';
import 'package:texi/features/register/data/register_endpoints.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';
import 'package:texi/features/register/domain/repo/driver_register_repo.dart';

class DriverRegisterRepoImpl implements DriverRegisterRepo {
  final dio = Dio();
  @override
  Future<DriverRegisterResponse> registerDriver(DriverEntity driver) async {
    try {
      final response = await dio.post(
        registerDriverEndpoint,
        data: DriverModel.fromEntity(driver).toJson(),
      );
      if (response.statusCode == 200) {
        return DriverRegisterResponse.fromJson(response.data);
      }
      return DriverRegisterResponse.fromJson({});
    } catch (e) {
      return DriverRegisterResponse.fromJson({});
    }
  }
}
