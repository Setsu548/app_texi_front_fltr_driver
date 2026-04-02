import 'package:geolocator/geolocator.dart';

//Geolocator States
//LocationServiceStatus.enabled
//LocationServiceStatus.disabled
//LocationServiceStatus.checking
class PositionServices {
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<Position> getCurrentPosition() async {
    if (await checkPermission() == LocationPermission.denied) {
      await requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }
}
