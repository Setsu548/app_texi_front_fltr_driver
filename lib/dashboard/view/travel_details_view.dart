import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_basic_info_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/origin_destination_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/trip_metrics_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelDetailsView extends HookWidget {
  const TravelDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText('Detalles del Viaje'),
                LabelText('En progreso'),
              ]
            ),
            LabelChip(
              text: '15 min', 
              colorText: lightColorScheme.onSurface,
              background: lightColorScheme.surfaceVariant,
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            DriverBasicInfo(
              personName: 'Maria Rodriguez',
              rating: 4.9,
              numberTrips: '124',
            ),
            SizedBox(height: 20),
            OriginDestination(
              originDescription: 'Av. Petrolera Sur 1602',
              originDestination: 'Plaza Colon 123',
            ),
            SizedBox(height: 20),
            TripMetrics(
              distance: '4.2 km',
              time: '15 min',
              tariff: '85',
            ),
            SizedBox(height: 20),
            BodyText('Informacion del viaje'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText('Metodo de pago'),
                Row(
                  children: [
                    Icon(Icons.account_balance_wallet, color: lightColorScheme.surfaceVariant),
                    SizedBox(width: 5),
                    BodyText('Efectivo')
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText('Tipo de servicio'),
                Row(
                  children: [
                    Icon(Icons.local_taxi, color: lightColorScheme.surfaceVariant),
                    SizedBox(width: 5),
                    BodyText('Estandar')
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Aceptar Viaje', 
          onPressed: (){}
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: 'Regresar', 
          onPressed: (){}
        )
      ],
    );
  }
}