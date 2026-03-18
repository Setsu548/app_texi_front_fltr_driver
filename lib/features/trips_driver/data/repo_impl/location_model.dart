import 'package:texi_driver/features/trips_driver/domain/entities/location_entity.dart';

class LocationModel {
  final double lat;
  final double lng;

  LocationModel({
    required this.lat,
    required this.lng,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    lat: json['lat'],
    lng: json['lng'],
  );

  LocationEntity toEntity() => LocationEntity(
    lat: lat,
    lng: lng,
  );

  factory LocationModel.fromEntity(LocationEntity entity) => LocationModel(
    lat: entity.lat,
    lng: entity.lng,
  );
  
  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
  };

}