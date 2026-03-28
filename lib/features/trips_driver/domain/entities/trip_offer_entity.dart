class TripOfferEntity {
  final String tripId;
  final double offeredPrice;
  final int etaMinutes;
  final double distanceToPickupKm;
  final String passengerName;
  final double? passengerRating;
  final String? originAddress;
  final String? destinationAddress;
  final double tripDistanceKm;
  final int   etaToDestinationMinutes;

  TripOfferEntity({
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
}
