import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/dashboard/domain/entities/dashboard_vehicle_entity.dart';

abstract class DashboarRepo {
  Future<DataApiResponse<List<DashboardVehicleEntity>>> getVehicleList();
}