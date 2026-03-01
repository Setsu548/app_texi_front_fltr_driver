import 'package:texi/features/register_vehicle/data/model/vehicle_image_model.dart';

class VehicleImageSaving {
  final String carId;
  final List<VehicleImageModel> cars;

  VehicleImageSaving({required this.carId, required this.cars});

  Map<String, dynamic> toJson() => {
    'car_id': carId,
    'cars': cars.map((vehicleImageModel) => vehicleImageModel.toJson()).toList(),
  };
}
