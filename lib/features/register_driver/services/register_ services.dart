import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';

class RegisterServices {
  static String? getUuid(String? token) {
    if (token == null) {
      return null;
    }
    final driverDataModel = DriverDataModel.fromRawJson(token);
    return driverDataModel.uuid;
  }
}
