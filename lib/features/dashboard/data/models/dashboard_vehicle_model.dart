import 'package:texi_driver/features/dashboard/domain/entities/dashboard_vehicle_entity.dart';

class DashboardVehicleModel extends DashboardVehicleEntity {
  DashboardVehicleModel({
    required super.brand,
    required super.model,
    required super.licensePlate,
  });

  factory DashboardVehicleModel.fromJson(Map<String, dynamic> json) {
    return DashboardVehicleModel(
      brand: json['brand'],
      model: json['model'],
      licensePlate: json['license_plate'],
    );
  }
}
