import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/date_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/pill_switch_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/travel_request_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverDashboardView extends HookWidget {
  const DriverDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final isOn = useState(false); 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: SizedBox()),
            DateChip(text: '25 Julio 2025'),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText('Estado actual'),
                    BodyText('Activo', color: lightColorScheme.surfaceDim)
                  ]
                ),
                PillSwitch(
                  value: isOn.value, 
                  onChanged: (v) {
                    isOn.value = v;
                    if(v) {
                      appRouter.push('/dashboard/driver_auth');
                    }
                  }
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText('Tu trayectoria junto a TEXI', color: lightColorScheme.primary),
            SizedBox(height: 10),
            LabelText('En viajes atendidos'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText('5,230.75 Bs.', color: lightColorScheme.primary),
                TitleText('750 Km.', color: lightColorScheme.primary)
              ],
            ),
            SizedBox(height: 10),
            LabelText('Periodo: 01/05/2023 - 31/05/2023'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText('Viajes completados:'),
                BodyText('38', color: lightColorScheme.primary)
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        TitleText('Solicitudes de viaje'),
        LabelText('Selecciona una solicitud para aceptar'),
        SizedBox(height: 20),
        TravelRequest(
          originTime: '5 min',
          originDescription: 'Av. Petrolera Sur 1602',
          destinationDescription: 'Av. Heroinas 222',
          onPressedDetail: (){
            appRouter.push('/dashboard/travel_details');
          },
          distance: '4.2 Km',
          estimatedTime: '15min',
          earnings: '\$10 Bs.',
          avatarUrl: 'assets/images/texi.png',
          nameDriver: 'Maria Roberta',
          ratingDriver: 4.8,
          onPressedAccept: (){},
        ),
        SizedBox(height: 20),
        TravelRequest(
          originTime: '3 min',
          originDescription: 'Calle Durango 215, Zona Norte',
          destinationDescription: 'Aeropuerto Internacional de la Ciudad de Cochabamba',
          onPressedDetail: (){},
          distance: '12.8 Km',
          estimatedTime: '35 min',
          earnings: '\$20 Bs.',
          avatarUrl: 'assets/images/texi.png',
          nameDriver: 'Carlos Mamani',
          ratingDriver: 4.5,
          onPressedAccept: (){},
        ),
      ],
    );
  }
}