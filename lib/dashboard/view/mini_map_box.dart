import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MiniMapBox extends StatefulWidget {
  const MiniMapBox({
    super.key,
    required this.initialPosition,
    required this.destinationPosition,
  });

  final LatLng initialPosition;
  final LatLng destinationPosition;

  @override
  State<MiniMapBox> createState() => _MiniMapBoxState();
}

class _MiniMapBoxState extends State<MiniMapBox> {
  GoogleMapController? controller;
  final polylinePoints = PolylinePoints(
    apiKey: "AIzaSyCF-G92s-uEnbhpEtvEJtYq_Ks8hDYh9jA",
  );

  Future<List> getPolyPoints() async {
    final response = await polylinePoints.getRouteBetweenCoordinatesV2(
      request: RoutesApiRequest(
        origin: PointLatLng(
          widget.initialPosition.latitude,
          widget.initialPosition.longitude,
        ),
        destination: PointLatLng(
          widget.destinationPosition.latitude,
          widget.destinationPosition.longitude,
        ),
        travelMode: TravelMode.driving,
        routingPreference: RoutingPreference.trafficAware,
      ),
    );
    if (response.routes.isNotEmpty) {
      final route = response.routes.first;

      // Access route information
      log('Duration: ${route.durationMinutes} minutes');
      log('Distance: ${route.distanceKm} km');
      log('Points: ${route.polylinePoints} ');
      // Get polyline points
      List<PointLatLng> points = route.polylinePoints ?? [];
      return points;
    }
    return [];
  }

  void zoomToFit({
    required LatLng origin,
    required LatLng destination,
    required GoogleMapController controller,
  }) {
    LatLngBounds bounds;

    if (origin.latitude > destination.latitude) {
      if (origin.longitude > destination.longitude) {
        bounds = LatLngBounds(southwest: destination, northeast: origin);
      } else {
        bounds = LatLngBounds(
          southwest: LatLng(destination.latitude, origin.longitude),
          northeast: LatLng(origin.latitude, destination.longitude),
        );
      }
    } else {
      if (origin.longitude > destination.longitude) {
        bounds = LatLngBounds(
          southwest: LatLng(origin.latitude, destination.longitude),
          northeast: LatLng(destination.latitude, origin.longitude),
        );
      } else {
        bounds = LatLngBounds(southwest: origin, northeast: destination);
      }
    }

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(bounds, 30), // padding
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,
      ),
      clipBehavior: Clip.hardEdge,
      child: FutureBuilder(
        future: getPolyPoints(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return GoogleMap(
              onMapCreated: (c) {
                controller = c;
                zoomToFit(
                  origin: widget.initialPosition,
                  destination: widget.destinationPosition,
                  controller: c,
                );
              },
              initialCameraPosition: CameraPosition(
                target: widget.initialPosition,
                zoom: 13,
              ),
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              polylines: asyncSnapshot.data != null
                  ? {
                      Polyline(
                        polylineId: PolylineId('route1'),
                        points: (asyncSnapshot.data as List)
                            .map(
                              (e) => LatLng(
                                (e as PointLatLng).latitude,
                                e.longitude,
                              ),
                            )
                            .toList(),
                        color: Colors.blue,
                        width: 5,
                      ),
                    }
                  : {},
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
