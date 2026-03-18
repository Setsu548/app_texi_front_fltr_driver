import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';
import 'package:texi_driver/features/trips_driver/services/trip_offers_passenger.dart';
import 'package:texi_driver/features/trips_driver/services/trip_states_services.dart';

class TripPassengerOffersPage extends ConsumerStatefulWidget {
  const TripPassengerOffersPage({super.key});

  @override
  ConsumerState<TripPassengerOffersPage> createState() =>
      _TripPassengerOffersPageState();
}

class _TripPassengerOffersPageState
    extends ConsumerState<TripPassengerOffersPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TripOffersPassenger.listenOffers(ref);
    });
  }


  @override
  Widget build(BuildContext context) {
    final offers = ref.watch(tripOffersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          passengerOffers.i18n,
          style: StylesForTexts(context: context).headerStyle(),
        ),
        centerTitle: true,
      ),
      body: offers.isEmpty
          ? Center(
              child: Text(
                waitingForOffers.i18n,
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
                            '${estimatedTime.i18n}: ${offer.etaMinutes} min',
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
                              offeredPrice.i18n,
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
                                  customSnackBar(rejectedOffer.i18n, context),
                                );
                              },
                              child: Text(reject.i18n),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButtonWidget(
                              label: accept.i18n,
                              width: 28.w,
                              onPressed: () async {
                                final offertAcceptedId = offer.tripId;
                                if (await TripStatesServices.acceptTrip(
                                  offertAcceptedId,
                                  ref,
                                )) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackBar(
                                        acceptedOffer.i18n,
                                        context,
                                      ),
                                    );
                                    context.push(
                                      '${AppRouter.tripPassengerOffersLocation}/${AppRouter.roadToOriginLocation}',
                                      extra: offertAcceptedId,
                                    );
                                  }
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      customSnackBar(
                                        errorAcceptOffer.i18n,
                                        context,
                                      ),
                                    );
                                  }
                                }
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
