import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
import 'package:texi_driver/features/trips_driver/data/model/trip_offer_model.dart';
import 'package:texi_driver/features/trips_driver/services/trip_offers_passenger.dart';

final tripOffersServiceProvider = Provider<TripOffersPassenger?>((ref) {
  final socketServiceAsyncValue = ref.watch(socketServiceProvider);

  return socketServiceAsyncValue.when(
    data: (socketService) {
      if (socketService == null) return null;
      return TripOffersPassenger(socketService);
    },
    loading: () => null,
    error: (_, _) => null,
  );
});

final tripOffersProvider =
    NotifierProvider<TripOffersNotifier, List<TripOfferModel>>(
      TripOffersNotifier.new,
    );

class TripOffersNotifier extends Notifier<List<TripOfferModel>> {
  TripOffersPassenger? _service;

  @override
  List<TripOfferModel> build() {
    _service = ref.watch(tripOffersServiceProvider);
    _initListener();
    return [];
  }

  void _initListener() {
    if (_service != null) {
      _service!.listenToOffers((offerData) {
        if (offerData != null && offerData is Map) {
          try {
            final offerMap = Map<String, dynamic>.from(offerData);
            final offer = TripOfferModel.fromJson(offerMap);
            if (!state.any((e) => e.tripId == offer.tripId)) {
              state = [...state, offer];
            } else {
              state = [
                for (final e in state)
                  if (e.tripId == offer.tripId) offer else e,
              ];
            }
          } catch (e) {
            print('Error parsing trip offer: $e');
          }
        }
      });
    }
  }

  void acceptOffer(String tripId) {
    _service?.acceptOffer(tripId);
    state = state.where((offer) => offer.tripId != tripId).toList();
  }
}
