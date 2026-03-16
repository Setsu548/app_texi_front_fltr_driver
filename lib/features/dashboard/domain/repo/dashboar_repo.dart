import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/dashboard/domain/entities/dashboard_vehicle_entity.dart';

abstract class DashboarRepo {
  Future<DataApiResponse<List<DashboardVehicleEntity>>> getVehicleList();
}