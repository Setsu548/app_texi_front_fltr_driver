import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_picker_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehiclePhotoRegistrationView extends HookWidget {
  const VehiclePhotoRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context.intl.titleTextVehiclePhotos, color: lightColorScheme.primary),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabelText(
              context.intl.labelTextVehiclePhotosInstruction,
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 20),
            CardPrimaryContainer(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: lightColorScheme.surfaceVariant),
                    SizedBox(width: 20),
                    Expanded(
                      child: 
                        LabelText(context.intl.cardPrimaryContainerVehiclePhotosInfo,
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextFront, color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: context.intl.photoPickerTapLabel, onTap: (){}),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextLeftSide, color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: context.intl.photoPickerTapLabel, onTap: (){}),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextRightSide, color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: context.intl.photoPickerTapLabel, onTap: (){}),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextBack, color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: context.intl.photoPickerTapLabel, onTap: (){})
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue, 
          onPressed: (){
            appRouter.push('/security/registration_confirmation_vehicle');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: context.intl.secondaryVariantButtonContinueLater,
          onPressed: (){}
        )
      ],
    );
  }
}