import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

class TripPassengerOffersPage extends ConsumerWidget {
  const TripPassengerOffersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escuchar el estado de las ofertas de viaje desde el provider
    final offers = ref.watch(tripOffersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ofertas de Pasajeros',
          style: StylesForTexts(context: context).headerStyle(),
        ),
        centerTitle: true,
      ),
      body: offers.isEmpty
          ? Center(
              child: Text(
                'Esperando ofertas...',
                style: StylesForTexts(context: context).headerStyleSmall(),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  color: Theme.of(context).colorScheme.secondary.withAlpha(50),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ID: ${offer.tripId}',
                          style: StylesForTexts(context: context)
                              .bodyStyle()
                              .copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.secondary.withValues(alpha: 0.5),
                                fontSize: 14.85.sp,
                              ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            'Tiempo estimado: ${offer.etaMinutes} min',
                            style: StylesForTexts(context: context)
                                .bodyStyle()
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16.85.sp,
                                ),
                          ),
                        ),
                        SizedBox(height: 1.55.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Precio Ofrecido',
                              style: StylesForTexts(context: context)
                                  .bodyStyle()
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontSize: 16.85.sp,
                                  ),
                            ),
                            Text(
                              '${offer.offeredPrice.toStringAsFixed(2)} Bs.',
                              style: StylesForTexts(
                                context: context,
                              ).headerStyleSmall(),
                            ),
                          ],
                        ),
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  customSnackBar('Oferta rechazada', context),
                                );
                              },
                              child: const Text('Rechazar'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButtonWidget(
                              label: 'Aceptar',
                              width: 28.w,
                              onPressed: () {
                                final offertAcceptedId = offer
                                    .tripId; // Aquí puedes implementar la lógica para aceptar la oferta
                                ref
                                    .read(tripOffersProvider.notifier)
                                    .acceptOffer(offertAcceptedId);
                                context.push(
                                  '${AppRouter.tripPassengerOffersLocation}/${AppRouter.roadToOriginLocation}',
                                  extra: offertAcceptedId,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
