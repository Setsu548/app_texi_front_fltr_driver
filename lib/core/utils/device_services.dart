import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:texi/features/auth/data/models/device_info_model.dart';

class DeviceServices {
  static Future<DeviceInfoModel> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    NetworkInfo networkInfo = NetworkInfo();

    String brand = "Unknown";
    String model = "Unknown";
    String? ip = await networkInfo.getWifiIP();
    String os = Platform.isAndroid ? "android" : "ios";

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      brand = androidInfo.brand;
      model = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      brand = "Apple";
      model = iosInfo.utsname.machine;
    }

    return DeviceInfoModel.fromMap({
      "brand": brand,
      "ip": ip ?? "0.0.0.0",
      "model": model,
      "os": os,
    });
  }
}
