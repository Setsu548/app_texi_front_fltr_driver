import 'dart:io';

import 'package:texi/core/utils/image_picker_service.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_image_entity.dart';

class Parser {
  static Future<List<VehicleImageEntity>> parseVehicleImages(
    File? frontImage,
    File? leftSideImage,
    File? rightSideImage,
    File? backSideImage,
  ) async {
    List<VehicleImageEntity> temp = [];

    if (frontImage != null) {
      final image = await ImagePickerService.imageToBase64(frontImage);
      temp.add(VehicleImageEntity(image: image ?? '', imageName: 'front-view'));
    }
    if (leftSideImage != null) {
      final image = await ImagePickerService.imageToBase64(leftSideImage);
      temp.add(
        VehicleImageEntity(image: image ?? '', imageName: 'left-side-view'),
      );
    }
    if (rightSideImage != null) {
      final image = await ImagePickerService.imageToBase64(rightSideImage);
      temp.add(
        VehicleImageEntity(image: image ?? '', imageName: 'right-side-view'),
      );
    }
    if (backSideImage != null) {
      final image = await ImagePickerService.imageToBase64(backSideImage);
      temp.add(
        VehicleImageEntity(image: image ?? '', imageName: 'back-side-view'),
      );
    }
    return temp;
  }
}
