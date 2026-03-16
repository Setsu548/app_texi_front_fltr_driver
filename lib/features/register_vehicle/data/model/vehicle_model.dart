import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_entity.dart';

class VehicleModel extends VehicleEntity {
  VehicleModel({
    required super.brand,
    required super.model,
    required super.year,
    required super.vin,
    required super.insurancePolicy,
    required super.licensePlate,
    required super.color,
    required super.tittleDeed,
  });

  factory VehicleModel.fromEntity(VehicleEntity entity) {
    return VehicleModel(
      brand: entity.brand,
      model: entity.model,
      year: entity.year,
      vin: entity.vin,
      insurancePolicy: entity.insurancePolicy,
      licensePlate: entity.licensePlate,
      color: entity.color,
      tittleDeed: entity.tittleDeed,
    );
  }

  VehicleModel copyWith({
    String? brand,
    String? model,
    int? year,
    String? vin,
    String? insurancePolicy,
    String? licensePlate,
    String? color,
    String? tittleDeed,
  }) {
    return VehicleModel(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      vin: vin ?? this.vin,
      insurancePolicy: insurancePolicy ?? this.insurancePolicy,
      licensePlate: licensePlate ?? this.licensePlate,
      color: color ?? this.color,
      tittleDeed: tittleDeed ?? this.tittleDeed,
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      brand: json['brand'],
      model: json['model'],
      year: json['year'],
      vin: json['vin'],
      insurancePolicy: json['insurance_policy'],
      licensePlate: json['license_plate'],
      color: json['color'],
      tittleDeed: json['tittle_deed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'year': year,
      'vin': vin,
      'insurance_policy': insurancePolicy,
      'license_plate': licensePlate,
      'color': color,
      'tittle_deed': tittleDeed,
    };
  }
}
