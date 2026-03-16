import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/utils/device_services.dart';
import 'package:texi_driver/features/auth/data/models/device_info_model.dart';

final deviceProvider = FutureProvider<DeviceInfoModel>(
  (ref) => DeviceServices.getDeviceInfo(),
);
