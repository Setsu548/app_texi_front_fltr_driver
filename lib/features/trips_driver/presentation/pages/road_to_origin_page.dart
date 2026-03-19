import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/providers/google_directions_provider.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/core/widgets/loading_component.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/actions_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/state/action_button_state.dart';
import 'package:texi_driver/features/trips_driver/services/trip_states_services.dart';

class RoadToOriginPage extends ConsumerStatefulWidget {
  const RoadToOriginPage({super.key});

  @override
  ConsumerState<RoadToOriginPage> createState() => _RoadToOriginPageState();
}

class _RoadToOriginPageState extends ConsumerState<RoadToOriginPage> {
  GoogleMapController? _mapController;

  // Sin initState: el RouteNotifier observa destinyProvider reactivamente y
  // arranca/reinicia el tracking automáticamente cuando el destino cambia.

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  // Anima la cámara suavemente hacia la posición actual del conductor.
  void _animateCamera(LatLng position) {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final actionState = ref.watch(actionsProvider);
    final tripId = ref.watch(tripIdProvider);
    final routeState = ref.watch(routeProvider);

    // Cada vez que cambia la posición del conductor, mueve la cámara.
    ref.listen<RouteState>(routeProvider, (prev, next) {
      if (next.driverPosition != null &&
          next.driverPosition != prev?.driverPosition) {
        _animateCamera(next.driverPosition!);
      }
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          roadToOrigin.i18n,
          style: StylesForTexts(context: context).headerStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: routeState.isLoading
                    ? Center(child: loadingComponent())
                    : GoogleMap(
                        onMapCreated: (controller) {
                          _mapController = controller;
                          // Mueve la cámara al primer fix de posición.
                          if (routeState.driverPosition != null) {
                            _animateCamera(routeState.driverPosition!);
                          }
                        },
                        initialCameraPosition: CameraPosition(
                          target:
                              routeState.driverPosition ?? const LatLng(0, 0),
                          zoom: 15.5,
                        ),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        zoomControlsEnabled: true,
                        polylines: routeState.polylines,
                        markers: routeState.markers,
                        trafficEnabled: true,
                      ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButtonWidget(
              label: _getButtonLabel(actionState),
              width: double.infinity,
              onPressed: tripId == null
                  ? null
                  : () => _handleOnPressed(actionState, tripId),
            ),
            SizedBox(height: 5.95.h),
          ],
        ),
      ),
    );
  }

  String _getButtonLabel(ActionButtonState actionState) {
    if (!actionState.isArrived) return arrivedToOrigin.i18n;
    if (!actionState.isTripStarted) return startTrip.i18n;
    if (!actionState.isTripFinished) return finishTrip.i18n;
    return tripFinished.i18n;
  }

  void _handleOnPressed(ActionButtonState actionState, String tripId) async {
    final notifier = ref.read(actionsProvider.notifier);

    if (!actionState.isArrived) {
      notifier.setIsArrived(true);
      TripStatesServices.arriveTrip(tripId, ref);
    } else if (!actionState.isTripStarted) {
      notifier.setIsTripStarted(true);
      TripStatesServices.startTrip(tripId, ref);
    } else if (!actionState.isTripFinished) {
      TripStatesServices.finishTrip(tripId, ref);
      notifier.setIsTripFinished(true);
      notifier.reset();
      // El autoDispose del routeProvider cancela el timer automáticamente.
      AppRouter.routes.go(AppRouter.tripPassengerOffersLocation);
    }
  }
}
