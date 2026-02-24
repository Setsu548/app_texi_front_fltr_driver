import 'package:dio/dio.dart';
import 'package:texi/features/register/data/models/driver_data_res_model.dart';
import 'package:texi/features/register/data/models/driver_model.dart';
import 'package:texi/features/register/data/models/geo_data_res_model.dart';
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
      final response = await dio.get('$departmentsEndpoint$country');
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
      print(e.toString());
      return GeoDataResModel.fromError({}, 500, e.toString());
    }
  }
}
