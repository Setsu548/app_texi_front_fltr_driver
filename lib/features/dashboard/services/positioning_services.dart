import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:texi_driver/core/utils/position_services.dart';
import 'package:texi_driver/core/utils/socket_service.dart';
import 'package:texi_driver/features/dashboard/data/models/drive_position_model.dart';

class PositioningServices {
  final SocketService? _socketService;
  Timer? _timer;

  PositioningServices(this._socketService);

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      final position = await PositionServices().getCurrentPosition();
      final drivePosition = DrivePositionModel(
        lat: position.latitude,
        lng: position.longitude,
        bearing: 0,
        speed: 0,
      );
      _socketService!.sendMessage('location:update', drivePosition.toJson());
    });
  }

  void stop() {
    _timer?.cancel();
  }

  Future<bool> checkPermission() async {
    return await PositionServices().checkPermission() ==
        LocationPermission.denied;
  }
}
