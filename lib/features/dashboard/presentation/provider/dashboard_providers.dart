import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/dio_provider.dart';
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
