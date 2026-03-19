import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
import 'package:texi_driver/features/trips_driver/data/model/trip_offer_model.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

class TripOffersPassenger {
  /// Inicia el listener del socket para el evento 'trip:offer'.
  /// Captura el notifier ANTES del callback para evitar usar `ref`
  /// cuando el widget ya fue desmontado.
  static void listenOffers(WidgetRef ref) {
    final socketService = ref.read(socketServiceProvider).value;
    final offersNotifier = ref.read(tripOffersProvider.notifier);
    socketService?.onMessage('trip:offer', (data) {
      final offer = TripOfferModel.fromJson(Map<String, dynamic>.from(data));
      print(offer);
      //TODO: Revisar la filtración de ofertas, solo deben llegar las ofertas que esten disponibles
      offersNotifier.addOrUpdate(offer);
    });
  }

  /* static void tripAccepted(WidgetRef ref, BuildContext context) {
    final socketService = ref.read(socketServiceProvider).value;
    socketService?.onMessage('trip:accepted', (data) {
      
    });
  } */
}
