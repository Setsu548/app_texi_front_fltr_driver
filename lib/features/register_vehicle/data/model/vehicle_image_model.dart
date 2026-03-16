import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_image_entity.dart';

class VehicleImageModel extends VehicleImageEntity {
  VehicleImageModel({required super.image, required super.imageName});

  factory VehicleImageModel.fromEntity(VehicleImageEntity entity) {
    return VehicleImageModel(image: entity.image, imageName: entity.imageName);
  }

  factory VehicleImageModel.fromJson(Map<String, dynamic> json) =>
      VehicleImageModel(image: json['image'], imageName: json['image_name']);

  Map<String, dynamic> toJson() => {'image': image, 'image_name': imageName};
}
