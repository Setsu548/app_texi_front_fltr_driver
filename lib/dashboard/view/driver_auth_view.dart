import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverAuthView extends HookWidget {
  const DriverAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.local_taxi,
          color: lightColorScheme.primary,
          size: 40,
        ),
        SizedBox(height: 20),
        TitleText('Activar TEXI'),
        SizedBox(height: 20),
        TitleText('Identificacion Facial'),
        SizedBox(height: 20),
        BodyText('Por favor, coloca tu rostro frente a la camara para verificar tu identidad y comienza a recibir viajes'),
        SizedBox(height: 200),
        LabelText('Asegurate de esta en un lugar bien iluminaco, sin prendas adicionales (gorra, anteojos, bufanda...)', textAlign: TextAlign.center,),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Iniciar Escaneo', 
          onPressed: (){}
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: 'Regresar', 
          onPressed: (){}
        ),
        SizedBox(height: 20),
        LabelText('Tu información biométrica está protegida y solo se usa para verificar tu identidad', textAlign: TextAlign.center,)
      ],
    );
  }
}