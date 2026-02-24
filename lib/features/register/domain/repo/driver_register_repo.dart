import 'package:texi/features/register/data/models/driver_data_res_model.dart';
import 'package:texi/features/register/data/models/geo_data_res_model.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';

abstract class DriverRegisterRepo {
  Future<DriverDataResModel> registerDriver(DriverEntity driver);
  Future<GeoDataResModel> getDepartments(String country);
}
