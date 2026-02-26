import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi/core/utils/device_services.dart';
import 'package:texi/features/auth/data/models/device_info_model.dart';

final deviceProvider = FutureProvider<DeviceInfoModel>(
  (ref) => DeviceServices.getDeviceInfo(),
);
