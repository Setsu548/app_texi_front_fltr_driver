import 'package:texi_driver/features/trips_driver/domain/entities/trip_offer_entity.dart';

class TripOfferModel {
  final String tripId;
  final double offeredPrice;
  final int etaMinutes;
  final double distanceToPickupKm;
  final String passengerName;
  final double? passengerRating;
  final String? originAddress;
  final String? destinationAddress;
  final double tripDistanceKm;
  final int etaToDestinationMinutes;

  TripOfferModel({
    required this.tripId,
    required this.offeredPrice,
    required this.etaMinutes,
    required this.distanceToPickupKm,
    required this.passengerName,
    this.passengerRating,
    this.originAddress,
    this.destinationAddress,
    required this.tripDistanceKm,
    required this.etaToDestinationMinutes,
  });

  factory TripOfferModel.fromJson(Map<String, dynamic> json) {
    return TripOfferModel(
      tripId: json['tripId']?.toString() ?? '',
      offeredPrice: (json['offeredPrice'] ?? 0).toDouble(),
      etaMinutes: json['etaMinutes'] ?? 0,
      distanceToPickupKm: json['distanceToPickupKm']?.toDouble() ?? 0,
      passengerName: json['passengerName']?.toString() ?? '',
      passengerRating: json['passengerRating']?.toDouble(),
      originAddress: json['originAddress']?.toString(),
      destinationAddress: json['destinationAddress']?.toString(),
      tripDistanceKm: json['tripDistanceKm']?.toDouble() ?? 0,
      etaToDestinationMinutes: json['etaToDestinationMinutes'] ?? 0,
    );
  }

  TripOfferEntity toEntity() {
    return TripOfferEntity(
      tripId: tripId,
      offeredPrice: offeredPrice,
      etaMinutes: etaMinutes,
      distanceToPickupKm: distanceToPickupKm,
      passengerName: passengerName,
      passengerRating: passengerRating,
      originAddress: originAddress,
      destinationAddress: destinationAddress,
      tripDistanceKm: tripDistanceKm,
      etaToDestinationMinutes: etaToDestinationMinutes,
    );
  }
}
