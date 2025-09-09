import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WelcomeView extends HookWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.local_taxi, 
          size: 50, 
          color: lightColorScheme.primary,
        ),
        SizedBox(height: 20),
        TitleText(context.intl.titleTextTexiRegister, color: lightColorScheme.primary),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: lightColorScheme.primary, 
              child: Icon(
                Icons.person, 
                size: 50,
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 20),
            TitleText(
              context.intl.titleTextWelcomeDriver,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextWelcomeMessage,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CardPrimaryContainer(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: lightColorScheme.surfaceDim,),
                    SizedBox(width: 20),
                    Expanded(
                      child: 
                        LabelText(context.intl.labelTextCompleteDataInfo,
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer,
                image: DecorationImage(
                  image: AssetImage('assets/images/texi.png'),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonStartRegistration, 
          onPressed: (){
            appRouter.push('/security/personal_info_form');
          }
        ),
        SizedBox(height: 20),
        LabelText(context.intl.labelTextTermsAndConditions, color: lightColorScheme.secondaryContainer, textAlign: TextAlign.center),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonCancel, onPressed: (){}),
      ],
    );
  }
}