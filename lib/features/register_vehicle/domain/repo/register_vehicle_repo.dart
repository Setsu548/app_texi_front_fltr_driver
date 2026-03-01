import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_res_model.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_image_entity.dart';

abstract class RegisterVehicleRepo {
  Future<DataApiResponse<VehicleResModel?>> registerVehicle(
    VehicleEntity vehicle,
    String token,
  );
  Future<DataApiResponse> registerVehicleImages(
    List<VehicleImageEntity> vehicleImages,
  );
}
