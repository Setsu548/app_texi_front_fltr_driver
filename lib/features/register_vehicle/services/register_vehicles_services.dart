import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi_driver/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';
import 'package:texi_driver/features/register_vehicle/services/image_parser_to_list.dart';

class RegisterVehiclesServices {
  static Future<void> registerVehicle(
    WidgetRef ref,
    VehicleEntity vehicle,
  ) async {
    if (await ref
        .read(registerVehicleProvider.notifier)
        .registerVehicle(vehicle)) {
      return;
    } else {
      throw Exception('Failed to register vehicle');
    }
  }

  static Future<void> registerVehicleImages(WidgetRef ref) async {
    final vehicleFrontPhoto = ref.watch(vehicleFrontPhotoProvider).value;
    final vehicleLeftSidePhoto = ref.watch(vehicleLeftSidePhotoProvider).value;
    final vehicleRightSidePhoto = ref
        .watch(vehicleRightSidePhotoProvider)
        .value;
    final vehicleBackSidePhoto = ref.watch(vehicleBackSidePhotoProvider).value;
    final imagesParsed = await ImageParserToList.parseVehicleImages(
      vehicleFrontPhoto,
      vehicleLeftSidePhoto,
      vehicleRightSidePhoto,
      vehicleBackSidePhoto,
    );

    if (await ref
        .read(vehicleImagesSavingProvider.notifier)
        .saveVehicleImages(imagesParsed)) {
      return;
    } else {
      throw Exception('Failed to register vehicle images');
    }
  }
}
