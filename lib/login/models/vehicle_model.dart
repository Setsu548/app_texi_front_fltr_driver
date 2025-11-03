// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VehicleModel {
  final String brand;
  final String color;
  final String license_plate;
  final String tittle_deed;
  final String model;
  final int? used_by;
  final String? user_id;
  final String? user_owner;
  final int year;
  VehicleModel({
    required this.brand,
    required this.color,
    required this.license_plate,
    required this.tittle_deed,
    required this.model,
    this.used_by,
    this.user_id,
    this.user_owner,
    required this.year,
  });


  VehicleModel copyWith({
    String? brand,
    String? color,
    String? license_plate,
    String? tittle_deed,
    String? model,
    int? used_by,
    String? user_id,
    String? user_owner,
    int? year,
  }) {
    return VehicleModel(
      brand: brand ?? this.brand,
      color: color ?? this.color,
      license_plate: license_plate ?? this.license_plate,
      tittle_deed: tittle_deed ?? this.tittle_deed,
      model: model ?? this.model,
      used_by: used_by ?? this.used_by,
      user_id: user_id ?? this.user_id,
      user_owner: user_owner ?? this.user_owner,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'brand': brand,
      'color': color,
      'license_plate': license_plate,
      'tittle_deed': tittle_deed,
      'model': model,
      'used_by': used_by,
      'user_id': user_id,
      'user_owner': user_owner,
      'year': year,
    };
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      brand: map['brand'] as String,
      color: map['color'] as String,
      license_plate: map['license_plate'] as String,
      tittle_deed: map['tittle_deed'] as String,
      model: map['model'] as String,
      used_by: map['used_by'] != null ? map['used_by'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as String : null,
      user_owner: map['user_owner'] != null ? map['user_owner'] as String : null,
      year: map['year'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleModel.fromJson(String source) => VehicleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VehicleModel(brand: $brand, color: $color, license_plate: $license_plate, tittle_deed: $tittle_deed, model: $model, used_by: $used_by, user_id: $user_id, user_owner: $user_owner, year: $year)';
  }

  @override
  bool operator ==(covariant VehicleModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.brand == brand &&
      other.color == color &&
      other.license_plate == license_plate &&
      other.tittle_deed == tittle_deed &&
      other.model == model &&
      other.used_by == used_by &&
      other.user_id == user_id &&
      other.user_owner == user_owner &&
      other.year == year;
  }

  @override
  int get hashCode {
    return brand.hashCode ^
      color.hashCode ^
      license_plate.hashCode ^
      tittle_deed.hashCode ^
      model.hashCode ^
      used_by.hashCode ^
      user_id.hashCode ^
      user_owner.hashCode ^
      year.hashCode;
  }
}

class VehicleResponse {
  final String carUuid;
  VehicleResponse({
    required this.carUuid,
  });


  VehicleResponse copyWith({
    String? carUuid,
  }) {
    return VehicleResponse(
      carUuid: carUuid ?? this.carUuid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'car_uuid': carUuid,
    };
  }

  factory VehicleResponse.fromMap(Map<String, dynamic> map) {
    return VehicleResponse(
      carUuid: map['car_uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleResponse.fromJson(String source) => VehicleResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VehicleResponse(carUuid: $carUuid)';

  @override
  bool operator ==(covariant VehicleResponse other) {
    if (identical(this, other)) return true;
  
    return 
      other.carUuid == carUuid;
  }

  @override
  int get hashCode => carUuid.hashCode;
}

class VehicleUpdate {
  final String data;
  VehicleUpdate({
    required this.data,
  });

  VehicleUpdate copyWith({
    String? data,
  }) {
    return VehicleUpdate(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data,
    };
  }

  factory VehicleUpdate.fromMap(Map<String, dynamic> map) {
    return VehicleUpdate(
      data: map['data'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleUpdate.fromJson(String source) => VehicleUpdate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VehicleUpdate(data: $data)';

  @override
  bool operator ==(covariant VehicleUpdate other) {
    if (identical(this, other)) return true;
  
    return 
      other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

