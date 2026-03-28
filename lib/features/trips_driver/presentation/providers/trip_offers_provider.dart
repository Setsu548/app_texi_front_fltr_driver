import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/features/trips_driver/data/model/trip_offer_model.dart';
import 'package:texi_driver/features/trips_driver/domain/entities/location_entity.dart';

//--Provider de lista de ofertas de viaje--//
final tripOffersProvider =
    NotifierProvider<TripOffersNotifier, List<TripOfferModel>>(
      TripOffersNotifier.new,
    );

class TripOffersNotifier extends Notifier<List<TripOfferModel>> {
  @override
  List<TripOfferModel> build() => [];

  /// Agrega una oferta nueva o actualiza si ya existe el mismo tripId.
  void addOrUpdate(TripOfferModel offer) {
    final exists = state.any((e) => e.tripId == offer.tripId);
    if (exists) {
      state = [for (final e in state) e.tripId == offer.tripId ? offer : e];
    } else {
      state = [...state, offer];
    }
  }

  void clear() {
    state = [];
  }
}
//--//

//--Provider de Origen--//
class OriginNotifier extends Notifier<LocationEntity> {
  @override
  LocationEntity build() {
    return LocationEntity(lat: 0, lng: 0);
  }

  void setLocation(LocationEntity location) {
    state = location;
  }
}

final originProvider = NotifierProvider<OriginNotifier, LocationEntity>(
  OriginNotifier.new,
);
//--//

//--Provider de destino--//
class DestinyNotifier extends Notifier<LocationEntity> {
  @override
  LocationEntity build() {
    return LocationEntity(lat: 0, lng: 0);
  }

  void setLocation(LocationEntity location) {
    state = location;
  }
}

final destinyProvider = NotifierProvider<DestinyNotifier, LocationEntity>(
  DestinyNotifier.new,
);
//--//

class TripAcceptedInfoNotifier extends Notifier<TripOfferModel?> {
  @override
  TripOfferModel? build() {
    return null;
  }

  void setTripAcceptedInfo(TripOfferModel tripAcceptedInfo) {
    state = tripAcceptedInfo;
  }

  void clear() {
    state = null;
  }
}

final tripAcceptedInfoProvider =
    NotifierProvider<TripAcceptedInfoNotifier, TripOfferModel?>(
      TripAcceptedInfoNotifier.new,
    );
