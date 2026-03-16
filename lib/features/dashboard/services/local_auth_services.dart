import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';

class LocalAuthServices {
  final LocalAuthentication auth;
  LocalAuthServices({required this.auth});

  Future<bool?> checkBiometrics() async {
    bool? canCheckBiomerics;
    try {
      canCheckBiomerics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {}
    return canCheckBiomerics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {}
    return availableBiometrics;
  }

  Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: authenticateToContinue.i18n,
        persistAcrossBackgrounding: true,
        biometricOnly: true,
      );
    } on PlatformException catch (e) {}
    return authenticated;
  }

  Future<bool> stopAuthentication() async {
    bool stopAuthenticated = false;
    try {
      stopAuthenticated = await auth.stopAuthentication();
    } on PlatformException catch (e) {}
    return stopAuthenticated;
  }
}
