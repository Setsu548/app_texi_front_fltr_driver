import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/pill_switch_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends HookWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    const double labelWidth = 200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          context.intl.titleDriverProfileView,
          color: lightColorScheme.primary,
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        CardOnSurface(
          padding: EdgeInsets.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(''),
                    ),
                    Positioned(
                      bottom: 0,
                      right: -2,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: lightColorScheme.surfaceDim,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: lightColorScheme.secondary,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(
                      'Carlos Mendoza',
                      color: lightColorScheme.primary,
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 5),
                        BodyText('4.8 (238 ${context.intl.labelDriverProfileTrips})')
                      ],
                    ),
                    SizedBox(height: 5),
                    LabelText('${context.intl.labelDriverProfileDriverSince} julio 2025')
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsets.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyDriverProfileVehicleInfo,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: labelWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(context.intl.labelDriverProfileMakeModel),
                      BodyText('Toyota Corolla 2019')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(context.intl.labelDriverProfilePlate),
                      BodyText('ABC-123')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: labelWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(context.intl.labelDriverProfileColor),
                      BodyText('Blanco')
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(context.intl.labelDriverProfileCapacity),
                      BodyText('4 pasajeros')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsets.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyDriverProfileDocuments,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: labelWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(context.intl.bodyDriverProfileDriverLicense),
                      LabelText('${context.intl.labelDriverProfileExpires} 15/03/2025')
                    ],
                  ),
                ),
                LabelText(context.intl.labelDriverProfileVerified, color: lightColorScheme.surfaceDim)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: labelWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(context.intl.bodyDriverProfileVehicleInsurance),
                      LabelText('${context.intl.labelDriverProfileExpires} 10/09/2023')
                    ],
                  ),
                ),
                LabelText(context.intl.labelDriverProfileVerified, color: lightColorScheme.surfaceDim)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: labelWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(context.intl.bodyDriverProfileTechInspection),
                      LabelText('${context.intl.labelDriverProfileExpires} 22/11/2023')
                    ],
                  ),
                ),
                LabelText(context.intl.labelDriverProfileVerified, color: lightColorScheme.primary)
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 160,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){},
                  child: CardOnSurface(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    padding: EdgeInsetsGeometry.all(20),
                    backgroundColor: lightColorScheme.secondary,
                    children: [
                      Icon(
                        Icons.restart_alt_rounded,
                        size: 50,
                        color: lightColorScheme.primary,
                      ),
                      SizedBox(height: 10),
                      BodyText(
                        context.intl.cardDriverProfileTripHistory,
                        textAlign: TextAlign.center,
                      )
                    ]
                  ),
                ),
              )
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 160,
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){},
                  child: CardOnSurface(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    padding: EdgeInsetsGeometry.all(20),
                    backgroundColor: lightColorScheme.secondary,
                    children: [
                      Icon(
                        Icons.attach_money,
                        size: 50,
                        color: lightColorScheme.primary,
                      ),
                      SizedBox(height: 10),
                      BodyText(
                        context.intl.cardDriverProfileEarnings,
                        textAlign: TextAlign.center,
                      )
                    ]
                  ),
                ),
              )
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyDriverProfileSettings,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelDriverProfileNotifications),
                PillSwitch(value: false, onChanged: (e){})
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelDriverProfileDarkMode),
                PillSwitch(value: false, onChanged: (e){})
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyText(context.intl.labelDriverProfileSounds),
                PillSwitch(value: false, onChanged: (e){})
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.btnDriverProfileLogout, 
          onPressed: (){},
          backgroundColor: lightColorScheme.error,
          colorText: lightColorScheme.onSurface,
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        SecondaryVariantButton(
          text: context.intl.btnDriverProfileBack, 
          onPressed: (){
            context.pop();
          },
          borderColor: lightColorScheme.primary,
        )
      ],
    );
  }
}