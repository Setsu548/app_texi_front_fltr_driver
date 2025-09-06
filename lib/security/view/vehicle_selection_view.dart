import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehicleSelectionView extends HookWidget {
  const VehicleSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/texi.png',
              width: 140,           
              fit: BoxFit.contain,  
            ),
            TitleText(
              'Seleccion de Vehiculo',
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 20),
            BodyText(
              'Por favor seleccion una de las siguientes opciones para continuar con el proceso de registro',
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: 'Registrar Vehiculo Nuevo', 
              onPressed: (){
                appRouter.push('/security/vehicle_info_form');
              }
            ),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: 'Seleccionar Vehiculo Registrado', 
              backgroundColor: lightColorScheme.surfaceBright,
              onPressed: (){
                appRouter.push('/security/vehicle_plate');
              }
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.surfaceBright,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info
                ),
                SizedBox(width: 20),
                Expanded(
                  child: LabelText(
                    'Si ya ha registrado un vehiculo anteriormente puede seleccionarlo de la lista de vehiculos registrados. De lo contrario, registre un nuevo vehiculo para comenzar',
                    color: lightColorScheme.surface,
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: 'Continuar Despues', 
          onPressed: (){}
        )
      ],
    );
  }
}