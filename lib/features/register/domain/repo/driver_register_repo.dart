import 'package:texi/features/register/data/models/driver_register_response.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';

abstract class DriverRegisterRepo {
  Future<DriverRegisterResponse> registerDriver(DriverEntity driver);
}
