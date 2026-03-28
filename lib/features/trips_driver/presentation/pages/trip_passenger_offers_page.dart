import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/widgets/offers_card.dart';
import 'package:texi_driver/features/trips_driver/services/trip_offers_passenger.dart';

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
                return OffersCard(offer: offer);
              },
            ),
    );
  }
}
