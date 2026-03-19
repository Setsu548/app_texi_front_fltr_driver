import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/trips_driver/data/repo_impl/trip_repo_impl.dart';
import 'package:texi_driver/features/trips_driver/domain/repo/trip_repo.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/state/action_button_state.dart';

final actionsProvider = NotifierProvider<ActionsProvider, ActionButtonState>(
  ActionsProvider.new,
);

class ActionsProvider extends Notifier<ActionButtonState> {
  @override
  ActionButtonState build() {
    return ActionButtonState(
      isArrived: false,
      isTripStarted: false,
      isTripFinished: false,
    );
  }

  void setIsArrived(bool isArrived) {
    state = state.copyWith(isArrived: isArrived);
  }

  void setIsTripStarted(bool isTripStarted) {
    state = state.copyWith(isTripStarted: isTripStarted);
  }

  void setIsTripFinished(bool isTripFinished) {
    state = state.copyWith(isTripFinished: isTripFinished);
  }

  void reset() {
    state = ActionButtonState(
      isArrived: false,
      isTripStarted: false,
      isTripFinished: false,
    );
  }
}

final tripRepoProvider = Provider<TripRepo>((ref) {
  return TripRepoImpl();
});

final dioProviderActions = Provider<Dio>((ref) {
  final storage = GetIt.instance<AuthSecureStorageService>();

  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['WEB_SOCKET']!,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await storage.getString(StorageKeys.driverToken);

        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        handler.next(options);
      },
    ),
  );

  return dio;
});

class TripIdNotifier extends Notifier<String?> {
  @override
  String? build() {
    return null;
  }

  void setTripId(String tripId) {
    state = tripId;
  }
}

final tripIdProvider = NotifierProvider<TripIdNotifier, String?>(
  TripIdNotifier.new,
);
