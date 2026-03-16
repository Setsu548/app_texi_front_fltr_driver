import 'package:texi_driver/features/trips_driver/domain/entities/trip_offer_entity.dart';

class TripOfferModel {
  final String tripId;
  final double offeredPrice;
  final int etaMinutes;

  TripOfferModel({
    required this.tripId,
    required this.offeredPrice,
    required this.etaMinutes,
  });

  factory TripOfferModel.fromJson(Map<String, dynamic> json) {
    return TripOfferModel(
      tripId: json['tripId']?.toString() ?? '',
      offeredPrice: (json['offeredPrice'] ?? 0).toDouble(),
      etaMinutes: json['etaMinutes'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'offeredPrice': offeredPrice,
      'etaMinutes': etaMinutes,
    };
  }

  TripOfferEntity toEntity() {
    return TripOfferEntity(
      tripId: tripId,
      offeredPrice: offeredPrice,
      etaMinutes: etaMinutes,
    );
  }
}
