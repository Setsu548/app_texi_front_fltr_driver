import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/features/trips_driver/data/repo_impl/trip_repo_impl.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/actions_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

class TripStatesServices {
  static Future<bool> acceptTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final destinyNotifier = ref.read(destinyProvider.notifier);
    final tripIdNotifier = ref.read(tripIdProvider.notifier);

    final response = await TripRepoImpl().acceptTrip(tripId, dio);
    destinyNotifier.setLocation(response.data!.origin);
    tripIdNotifier.setTripId(tripId);

    return response.success;
  }

  static Future<bool> arriveTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final destinyNotifier = ref.read(destinyProvider.notifier);

    final response = await TripRepoImpl().arriveState(tripId, dio);
    destinyNotifier.setLocation(response.data!.destination);

    return response.success;
  }

  static Future<bool> startTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final response = await TripRepoImpl().startTrip(tripId, dio);
    return response.success;
  }

  static Future<bool> finishTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final tripOffersNotifier = ref.read(tripOffersProvider.notifier);

    final response = await TripRepoImpl().finishTrip(tripId, dio);
    tripOffersNotifier.clear();
    return response.success;
  }

  /* TODO: Implementar el rechazo de ofertas */
  /* static Future<bool> rejectTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final tripOffersNotifier = ref.read(tripOffersProvider.notifier);

    final response = await TripRepoImpl().rejectTrip(tripId, dio);
    tripOffersNotifier.remove(tripId);
    return response.success;
  } */
}
