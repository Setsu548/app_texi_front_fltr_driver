import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/providers/dio_provider.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/features/dashboard/data/repo_impl/dashboard_repo_impl.dart';
import 'package:texi/features/dashboard/domain/entities/dashboard_vehicle_entity.dart';
import 'package:texi/features/dashboard/domain/repo/dashboar_repo.dart';

final dashboardRepoProvider = Provider<DashboarRepo>((ref) {
  return DashboardRepoImpl(ref.watch(dioProvider));
});

class VehicleListNotifier
    extends Notifier<DataApiResponse<List<DashboardVehicleEntity>>> {
  @override
  DataApiResponse<List<DashboardVehicleEntity>> build() {
    return DataApiResponse(
      success: false,
      statusCode: 0,
      code: '',
      message: '',
      data: [],
      error: null,
    );
  }

  Future<void> getVehicleList() async {
    state = DataApiResponse(
      success: false,
      statusCode: 0,
      code: '',
      message: '',
      data: [],
      error: null,
    );
    final response = await ref.read(dashboardRepoProvider).getVehicleList();
    state = response;
  }
}

final vehicleListProvider =
    NotifierProvider<
      VehicleListNotifier,
      DataApiResponse<List<DashboardVehicleEntity>>
    >(VehicleListNotifier.new);

class SwitchActiveNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void toggleSwitch() {
    state = !state;
  }
}

final switchActiveProvider = NotifierProvider<SwitchActiveNotifier, bool>(
  SwitchActiveNotifier.new,
);

class SupportBiometricsNotifier extends Notifier<SupportBiometricsState> {
  @override
  SupportBiometricsState build() {
    return SupportBiometricsState.unknown;
  }

  void toggleSwitch(bool supported) {
    state = supported
        ? SupportBiometricsState.supported
        : SupportBiometricsState.unsupported;
  }
}

final supportBiometricsProvider =
    NotifierProvider<SupportBiometricsNotifier, SupportBiometricsState>(
      SupportBiometricsNotifier.new,
    );
