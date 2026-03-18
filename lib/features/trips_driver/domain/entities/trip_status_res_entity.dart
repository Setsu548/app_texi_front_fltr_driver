import 'package:texi_driver/features/trips_driver/domain/entities/location_entity.dart';

class TripStatusResEntity {
  final String tripId;
  final String passengerId;
  final String driverId;
  final String status;
  final double estimatedPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final LocationEntity origin;
  final LocationEntity destination;

  TripStatusResEntity({
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
}
