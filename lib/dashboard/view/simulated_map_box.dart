import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class SimulatedRouteMapPage extends StatefulWidget {
  final LatLng start;
  final LatLng end;

  const SimulatedRouteMapPage({
    super.key,
    required this.start,
    required this.end,
  });

  @override
  State<SimulatedRouteMapPage> createState() => _SimulatedRouteMapPageState();
}

class _SimulatedRouteMapPageState extends State<SimulatedRouteMapPage> {
  GoogleMapController? mapController;

  LatLng movingMarkerPos = const LatLng(0, 0);
  double movingBearing = 0;
  double lastBearing = 0;

  BitmapDescriptor? carIcon;

  List<LatLng> routePoints = [];
  bool _isSimulating = false;

  @override
  void initState() {
    super.initState();
    movingMarkerPos = widget.start;
    loadCarIcon();
  }

  Future<void> loadCarIcon() async {
    try {
      carIcon = await getResizedIcon('assets/images/taxi.png', 80);
    } catch (_) {
      carIcon = BitmapDescriptor.defaultMarker;
    }
    setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    loadRouteAndStartSimulation();
  }

  Future<void> loadRouteAndStartSimulation() async {
    if (_isSimulating) return;
    _isSimulating = true;

    routePoints = await getRoutePoints(widget.start, widget.end);

    if (routePoints.isEmpty) {
      print("ERROR: Ruta vacía. Revisa tu API KEY.");
      return;
    }

    setState(() {});

    // Ajustar cámara a toda la ruta
    await Future.delayed(Duration(milliseconds: 500));
    final bounds = _boundsFromLatLngList(routePoints);

    try {
      await mapController!.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 60),
      );
    } catch (_) {
      mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: widget.start, zoom: 14),
        ),
      );
    }

    final totalDistance = getTotalRouteDistance(routePoints); // metros
    final duration = getDurationByDistance(totalDistance); // Duration

    print("Distancia total: ${totalDistance.toStringAsFixed(0)} m");
    print("Duración estimada: ${duration.inSeconds} s");

    await simulateRoute(
      controller: mapController!,
      points: routePoints,
      duration: duration,
      onUpdatePosition: (pos, bearing) {
        setState(() {
          movingMarkerPos = pos;
          movingBearing = bearing;
        });
      },
    );

    _isSimulating = false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: widget.start,
          zoom: 15,
        ),
        onMapCreated: _onMapCreated,
        markers: {
          Marker(
            markerId: const MarkerId("car"),
            position: movingMarkerPos,
            icon: carIcon ?? BitmapDescriptor.defaultMarker,
            rotation: movingBearing,
            anchor: const Offset(0.5, 0.5),
          ),
        },
        polylines: {
          Polyline(
            polylineId: const PolylineId("route"),
            points: routePoints,
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
    required Duration duration,
    required Function(LatLng, double) onUpdatePosition,
  }) async {
    if (points.length < 2) return;

    final totalSegments = points.length - 1;
    final segmentDuration = duration.inMilliseconds ~/ totalSegments;

    for (int i = 0; i < totalSegments; i++) {
      await animateSegment(
        controller: controller,
        start: points[i],
        end: points[i + 1],
        durationMs: segmentDuration,
        onUpdatePosition: onUpdatePosition,
      );
    }
  }

  Future<void> animateSegment({
    required GoogleMapController controller,
    required LatLng start,
    required LatLng end,
    required int durationMs,
    required Function(LatLng, double) onUpdatePosition,
  }) async {
    final stopwatch = Stopwatch()..start();

    while (stopwatch.elapsedMilliseconds < durationMs) {
      final t = stopwatch.elapsedMilliseconds / durationMs;

      final lat = start.latitude + (end.latitude - start.latitude) * t;
      final lng = start.longitude + (end.longitude - start.longitude) * t;
      final pos = LatLng(lat, lng);

      final bearing = smoothBearing(getBearing(start, end));

      onUpdatePosition(pos, bearing);

      // Cámara estilo Uber: sigue y rota
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: pos,
            zoom: 16.5,
            bearing: bearing,
            tilt: 60,
          ),
        ),
      );

      await Future.delayed(Duration(milliseconds: 16));
    }

    onUpdatePosition(end, getBearing(start, end));
  }

  double smoothBearing(double newAngle) {
    double diff = (newAngle - lastBearing);

    if (diff.abs() > 30) {
      newAngle = lastBearing + diff.sign * 30;
    }

    lastBearing = newAngle;
    return newAngle;
  }


  double _distanceBetween(LatLng a, LatLng b) {
    const R = 6371000; // radio de la tierra en metros
    final dLat = (b.latitude - a.latitude) * pi / 180;
    final dLng = (b.longitude - a.longitude) * pi / 180;

    final lat1 = a.latitude * pi / 180;
    final lat2 = b.latitude * pi / 180;

    final h = sin(dLat / 2) * sin(dLat / 2) +
        sin(dLng / 2) * sin(dLng / 2) * cos(lat1) * cos(lat2);

    return 2 * R * atan2(sqrt(h), sqrt(1 - h));
  }

  double getTotalRouteDistance(List<LatLng> points) {
    double total = 0;
    for (int i = 0; i < points.length - 1; i++) {
      total += _distanceBetween(points[i], points[i + 1]);
    }
    return total;
  }

  Duration getDurationByDistance(double meters) {
    const speed = 70 * 1000 / 3600; // 40 km/h
    final seconds = meters / speed;
    return Duration(seconds: seconds.toInt());
  }


  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> poly = [];
    int index = 0, lat = 0, lng = 0;

    while (index < encoded.length) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      lat += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);

      lng += ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));

      poly.add(LatLng(lat / 1e5, lng / 1e5));
    }

    return poly;
  }

  Future<List<LatLng>> getRoutePoints(LatLng start, LatLng end) async {
    const apiKey = "AIzaSyCF-G92s-uEnbhpEtvEJtYq_Ks8hDYh9jA";

    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&mode=driving&key=$apiKey";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode != 200) {
      print("Directions API STATUS ERROR: ${res.statusCode}");
      return [];
    }

    final data = jsonDecode(res.body);

    if (data["routes"].isEmpty) {
      print("NO ROUTES: ${res.body}");
      return [];
    }

    return decodePolyline(data["routes"][0]["overview_polyline"]["points"]);
  }

  Future<BitmapDescriptor> getResizedIcon(String assetPath, int width) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await ui.instantiateImageCodec(bytes, targetWidth: width);
    final frame = await codec.getNextFrame();

    final ByteData? resized =
        await frame.image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(resized!.buffer.asUint8List());
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double x0 = list.first.latitude;
    double x1 = list.first.latitude;
    double y0 = list.first.longitude;
    double y1 = list.first.longitude;

    for (LatLng latLng in list) {
      if (latLng.latitude > x1) x1 = latLng.latitude;
      if (latLng.latitude < x0) x0 = latLng.latitude;
      if (latLng.longitude > y1) y1 = latLng.longitude;
      if (latLng.longitude < y0) y0 = latLng.longitude;
    }

    return LatLngBounds(
      northeast: LatLng(x1, y1),
      southwest: LatLng(x0, y0),
    );
  }

  double getBearing(LatLng start, LatLng end) {
    double lat1 = start.latitude * (3.14159265359 / 180);
    double lon1 = start.longitude * (3.14159265359 / 180);
    double lat2 = end.latitude * (3.14159265359 / 180);
    double lon2 = end.longitude * (3.14159265359 / 180);

    double dLon = lon2 - lon1;

    double y = sin(dLon) * cos(lat2);
    double x = cos(lat1) * sin(lat2) -
        sin(lat1) * cos(lat2) * cos(dLon);

    double brng = atan2(y, x);
    brng = brng * 180 / 3.14159265359;
    return (brng + 360) % 360;
  }
}
