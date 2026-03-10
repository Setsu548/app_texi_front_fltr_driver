class LoginVehicleModel {
  final String brand;
  final int year;
  final String model;
  final String licensePlate;
  final String color;
  final String tittleDeed;
  final String usedBy;

  LoginVehicleModel({
    required this.brand,
    required this.year,
    required this.model,
    required this.licensePlate,
    required this.color,
    required this.tittleDeed,
    required this.usedBy,
  });

  factory LoginVehicleModel.fromJson(Map<String, dynamic> json) {
    return LoginVehicleModel(
      brand: json['brand'],
      year: json['year'],
      model: json['model'],
      licensePlate: json['license_plate'],
      color: json['color'],
      tittleDeed: json['tittle_deed'],
      usedBy: json['used_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'year': year,
      'model': model,
      'license_plate': licensePlate,
      'color': color,
      'tittle_deed': tittleDeed,
      'used_by': usedBy,
    };
  }
}
