class DeviceInfoModel {
  final String brand;
  final String ip;
  final String model;
  final String os;

  DeviceInfoModel({
    required this.brand,
    required this.ip,
    required this.model,
    required this.os,
  });

  factory DeviceInfoModel.fromMap(Map<String, dynamic> map) => DeviceInfoModel(
    brand: map['brand'],
    ip: map['ip'],
    model: map['model'],
    os: map['os'],
  );
}
