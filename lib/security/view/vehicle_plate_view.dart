import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehiclePlateView extends HookWidget {
  const VehiclePlateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: lightColorScheme.primary, 
              child: Icon(
                Icons.local_taxi, 
                size: 50,
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 20),
            TitleText(
              'Verificacion de\nVehiculo',
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BodyText(
              'Ingrese la placa del vehiculo para verificar si esta registrado en nuestro sistema y vincularlo como conductor.',
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CardPrimaryContainer(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: lightColorScheme.surfaceVariant,),
                    SizedBox(width: 20),
                    Expanded(
                      child: 
                        LabelText('La placa debe ingresarse sin espacion ni caracteres especiales\n(ejemplo: ABC123).',
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            LabeledTextField(label: 'Numero de Placa', colorLabel: lightColorScheme.surface, hint: 'Ingrese la placa aqui'),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: 'Verificar Vehiculo', 
              onPressed: (){
                appRouter.push('/security/vehicle_found');
              }
            ),
            SizedBox(height: 20),
            LinkTextPrimary(
              '¿No tienes un vehículo registrado? registre uno nuevo',
              colorText: lightColorScheme.surfaceVariant, 
              textAlign: TextAlign.center, 
              onTap: (){}
            )
          ],
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: 'Continuar Despues', onPressed: (){},)
      ],
    );
  }
}