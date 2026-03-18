import 'package:texi_driver/features/trips_driver/data/repo_impl/location_model.dart';
import 'package:texi_driver/features/trips_driver/domain/entities/trip_status_res_entity.dart';

class TripStatusResModel {
  final String tripId;
  final String passengerId;
  final String driverId;
  final String status;
  final double estimatedPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LocationModel origin;
  final LocationModel destination;

  TripStatusResModel({
    required this.tripId,
    required this.passengerId,
    required this.driverId,
    required this.status,
    required this.estimatedPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.origin,
    required this.destination,
  });

  factory TripStatusResModel.fromJson(Map<String, dynamic> json) => TripStatusResModel(
    tripId: json['tripId'],
    passengerId: json['passengerId'],
    driverId: json['driverId'],
    status: json['status'],
    estimatedPrice: (json['estimatedPrice'] as num).toDouble(),
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    origin: LocationModel.fromJson(json['origin']),
    destination: LocationModel.fromJson(json['destination']),
  );

  TripStatusResEntity toEntity() => TripStatusResEntity(
    tripId: tripId,
    passengerId: passengerId,
    driverId: driverId,
    status: status,
    estimatedPrice: estimatedPrice,
    createdAt: createdAt,
    updatedAt: updatedAt,
    origin: origin.toEntity(),
    destination: destination.toEntity(),
  );

  Map<String, dynamic> toJson() => {
    'tripId': tripId,
    'passengerId': passengerId,
    'driverId': driverId,
    'status': status,
    'estimatedPrice': estimatedPrice,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'origin': origin.toJson(),
    'destination': destination.toJson(),
  };
}