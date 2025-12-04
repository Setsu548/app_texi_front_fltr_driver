import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimulatedRouteMapPage extends StatefulWidget {
  const SimulatedRouteMapPage({super.key});

  @override
  State<SimulatedRouteMapPage> createState() => _SimulatedRouteMapPageState();
}

class _SimulatedRouteMapPageState extends State<SimulatedRouteMapPage> {
  GoogleMapController? mapController;

  LatLng movingMarkerPos = const LatLng(-16.48997, -68.11926);

  final List<LatLng> points = const [
    LatLng(-16.48997, -68.11926),
    LatLng(-16.49048, -68.11945),
    LatLng(-16.49094, -68.11957),
    LatLng(-16.49121, -68.11958),
    LatLng(-16.49143, -68.11951),
    LatLng(-16.49150, -68.11955),
    LatLng(-16.49200, -68.11957),
    LatLng(-16.49296, -68.11968),
    LatLng(-16.49324, -68.11977),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (mapController != null) {
        simulateRoute(
          controller: mapController!,
          points: points,
          duration: const Duration(seconds: 10),
          onUpdatePosition: (LatLng pos) {
            setState(() {
              movingMarkerPos = pos;
            });
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: points.first, zoom: 16),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId("moving"),
            position: movingMarkerPos,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure,
            ),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: points,
            width: 5,
            color: Colors.blue,
          ),
        },
      ),
    );
  }

  Future<void> simulateRoute({
    required GoogleMapController controller,
    required List<LatLng> points,
    Duration duration = const Duration(seconds: 10),
    required void Function(LatLng) onUpdatePosition,
  }) async {
    if (points.length < 2) return;

    final totalSegments = points.length - 1;
    final segmentDuration = duration ~/ totalSegments;

    for (int i = 0; i < totalSegments; i++) {
      final start = points[i];
      final end = points[i + 1];

      await animateSegment(
        controller: controller,
        start: start,
        end: end,
        duration: segmentDuration,
        onUpdatePosition: onUpdatePosition,
      );
    }
  }

  Future<void> animateSegment({
    required GoogleMapController controller,
    required LatLng start,
    required LatLng end,
    required Duration duration,
    required void Function(LatLng) onUpdatePosition,
  }) async {
    final stopwatch = Stopwatch()..start();
    final total = duration.inMilliseconds;

    while (stopwatch.elapsedMilliseconds < total) {
      final t = stopwatch.elapsedMilliseconds / total;

      final lat = start.latitude + (end.latitude - start.latitude) * t;
      final lng = start.longitude + (end.longitude - start.longitude) * t;

      final current = LatLng(lat, lng);
      onUpdatePosition(current);

      controller.animateCamera(CameraUpdate.newLatLng(current));

      await Future.delayed(const Duration(milliseconds: 16));
    }

    onUpdatePosition(end);
    controller.animateCamera(CameraUpdate.newLatLng(end));
  }
}
