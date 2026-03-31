import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

enum LocationServiceStatus { enabled, disabled, checking }

class LocationServiceMonitor with WidgetsBindingObserver {
  final _controller = StreamController<LocationServiceStatus>.broadcast();

  Stream<LocationServiceStatus> get stream => _controller.stream;

  late final StreamSubscription _serviceStatusSub;

  LocationServiceMonitor() {
    _serviceStatusSub = Geolocator.getServiceStatusStream().listen(
      (ServiceStatus status) {
        if (status == ServiceStatus.enabled) {
          _controller.add(LocationServiceStatus.enabled);
        } else {
          _controller.add(LocationServiceStatus.disabled);
        }
      },
    );

    _checkLocationService();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Re-check status when app resumes
      _checkLocationService();
    }
  }

  Future<void> _checkLocationService() async {
    _controller.add(LocationServiceStatus.checking);
    
    final isEnabled = await Geolocator.isLocationServiceEnabled();
    
    if (isEnabled) {
      _controller.add(LocationServiceStatus.enabled);
    } else {
      _controller.add(LocationServiceStatus.disabled);
    }
  }

  Future<bool> checkNow() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _serviceStatusSub.cancel();
    _controller.close();
  }
}
