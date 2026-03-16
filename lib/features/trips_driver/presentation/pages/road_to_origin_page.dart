import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/actions_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/state/action_button_state.dart';

class RoadToOriginPage extends ConsumerWidget {
  final String tripId;
  const RoadToOriginPage({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionState = ref.watch(actionsProvider);

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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 75.78.h,
              width: double.infinity,
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0, 0), // TODO: Cambiar por la ubicación de origen
                  zoom: 14.0,
                ),
                myLocationEnabled: true,
              ),
            ),
            SizedBox(height: 2.h),
            ElevatedButtonWidget(
              label: _getButtonLabel(actionState),
              width: double.infinity,
              onPressed: () => _handleOnPressed(ref, actionState),
            ),
          ],
        ),
      ),
    );
  }

  String _getButtonLabel(ActionButtonState actionState) {
    if (!actionState.isArrived) {
      return arrivedToOrigin.i18n;
    } else if (!actionState.isTripStarted) {
      return startTrip.i18n;
    } else if (!actionState.isTripFinished) {
      return finishTrip.i18n;
    }
    return tripFinished.i18n;
  }

  void _handleOnPressed(WidgetRef ref, actionState) async {
    final notifier = ref.read(actionsProvider.notifier);
    final dio = await ref.read(dioProviderActions);

    if (!actionState.isArrived) {
      notifier.setIsArrived(true);
      // Aquí puedes agregar lógica adicional (ej. socket emit 'driver:arrived')
      ref.read(tripRepoProvider).arriveState(tripId, dio);
    } else if (!actionState.isTripStarted) {
      notifier.setIsTripStarted(true);
      // Lógica adicional (ej. socket emit 'trip:started')
      ref.read(tripRepoProvider).startTrip(tripId, dio);
    } else if (!actionState.isTripFinished) {
      notifier.setIsTripFinished(true);
      // Lógica adicional (ej. socket emit 'trip:finished')
      ref.read(tripRepoProvider).finishTrip(tripId, dio);
    }
  }
}
