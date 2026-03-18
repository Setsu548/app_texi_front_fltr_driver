import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/features/trips_driver/data/repo_impl/trip_repo_impl.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/actions_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

class TripStatesServices {
  static Future<bool> acceptTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final response = await TripRepoImpl().acceptTrip(tripId, dio);
    ref.read(destinyProvider.notifier).setLocation(response.data!.origin);
    ref.read(tripIdProvider.notifier).setTripId(tripId);
    return response.success;
  }

  static Future<bool> arriveTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final response = await TripRepoImpl().arriveState(tripId, dio);
    ref.read(destinyProvider.notifier).setLocation(response.data!.destination);
    return response.success;
  }

  static Future<bool> startTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final response = await TripRepoImpl().startTrip(tripId, dio);
    return response.success;
  }

  static Future<bool> finishTrip(String tripId, WidgetRef ref) async {
    final dio = ref.read(dioProviderActions);
    final response = await TripRepoImpl().finishTrip(tripId, dio);
    ref.read(tripOffersProvider.notifier).clear();
    return response.success;
  }
}
