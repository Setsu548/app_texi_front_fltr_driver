import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/utils/location_connection_controller.dart';
import 'package:texi_driver/core/utils/location_service_monitor.dart';

final locationServiceMonitorProvider = Provider<LocationServiceMonitor>((ref) {
  final monitor = LocationServiceMonitor();
  ref.onDispose(() => monitor.dispose());
  return monitor;
});

final locationServiceStatusProvider = StreamProvider<LocationServiceStatus>((ref) {
  final monitor = ref.watch(locationServiceMonitorProvider);
  return monitor.stream;
});

final locationConnectionControllerProvider = Provider((ref) => LocationConnectionController());
