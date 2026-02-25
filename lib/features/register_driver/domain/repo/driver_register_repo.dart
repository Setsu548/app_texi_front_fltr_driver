import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi/features/register_driver/data/models/geo_data_res_model.dart';
import 'package:texi/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi/features/register_driver/domain/entities/identification_entity.dart';

abstract class DriverRegisterRepo {
  Future<DriverDataResModel> registerDriver(DriverEntity driver);
  Future<GeoDataResModel> getDepartments(String country);
  Future<DataApiResponse<String?>> registerDriverIdentification(
    IdentificationEntity identification,
  );
  Future<DataApiResponse<bool>> confirmDataRegister(String uuid);
}
