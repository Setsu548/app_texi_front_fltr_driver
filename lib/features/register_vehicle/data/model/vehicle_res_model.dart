class VehicleResModel {
  final String uuid;

  VehicleResModel({required this.uuid});

  factory VehicleResModel.fromJson(Map<String, dynamic> json) =>
      VehicleResModel(uuid: json['car_uuid']);
}
