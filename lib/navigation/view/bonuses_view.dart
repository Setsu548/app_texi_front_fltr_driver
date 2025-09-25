import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/bonus_progress_card_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/reward_list_tile_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BonusesView extends HookWidget {
  const BonusesView({super.key});

  @override
  Widget build(BuildContext context) {

    final tiles = <Widget>[
      RewardListTile(title: 'Bono por 50 viajes', dateText: '15 Oct 2023', amountText: '+\$120'),
      RewardListTile(title: 'Bono por calificacion', dateText: '30 Sep 2023', amountText: '+\$45'),
      RewardListTile(title: 'Bono por horas pico', dateText: '10 Nov 2023', amountText: '+\$75'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          context.intl.titleDriverBonusesView,
          color: lightColorScheme.primary,
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        BodyText(context.intl.bodyDriverBonusesSummaryEarnings, color: lightColorScheme.primary),
        SizedBox(height: 10),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelDriverBonusesTotalEarnings),
                BodyText('\$1,250.00', color: lightColorScheme.primary)
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelDriverBonusesBonuses),
                BodyText('+\$1,250.00', color: lightColorScheme.surfaceDim)
              ],
            ),
            Divider(
              thickness: 8,               
              color: lightColorScheme.secondaryContainer,
              height: 40,                  
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelDriverBonusesTotal),
                TitleText('\$1,570.00', color: lightColorScheme.primary)
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        BodyText(context.intl.bodyDriverBonusesActive, color: lightColorScheme.primary),
        SizedBox(height: 10),
        BonusProgressCard(
          title: 'Bono por Horas Pico',
          amountText: '\$150',
          description: 'Completa 10 viajes entre 6-9 PM',
          completed: 7,
          goal: 10,
        ),
        SizedBox(height: 10),
        BonusProgressCard(
          title: 'Bono por Fin de Semana',
          amountText: '\$200',
          description: 'Completa 20 viajes de viernes a domingo',
          completed: 12,
          goal: 20,
        ),
        SizedBox(height: 20),
        BodyText(context.intl.bodyDriverBonusesPerformanceRewards, color: lightColorScheme.primary),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.3,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightColorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lightColorScheme.secondaryContainer),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: lightColorScheme.secondaryContainer,
                    child: Icon(Icons.star_rounded,
                    size: 24, color: lightColorScheme.primary),
                  ),
                  SizedBox(height: 10),
                  BodyText('${context.intl.bodyDriverBonusesRating} 4.9'),
                  LabelText('+\$50 ${context.intl.labelDriverBonusesThisMonth}'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightColorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lightColorScheme.secondaryContainer),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: lightColorScheme.secondaryContainer,
                    child: Icon(Icons.speed_rounded,
                        size: 24, color: lightColorScheme.primary),
                  ),
                  SizedBox(height: 10),
                  BodyText(context.intl.bodyDriverBonusesFastTime),
                  LabelText('+\$35 ${context.intl.labelDriverBonusesThisMonth}'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightColorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lightColorScheme.secondaryContainer),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: lightColorScheme.secondaryContainer,
                    child: Icon(Icons.alt_route_rounded,
                    size: 24, color: lightColorScheme.primary),
                  ),
                  SizedBox(height: 10),
                  BodyText('100+ ${context.intl.bodyDriverBonusesTrips}'),
                  LabelText('+\$35 ${context.intl.labelDriverBonusesThisMonth}'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: lightColorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: lightColorScheme.secondaryContainer),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: lightColorScheme.secondaryContainer,
                    child: Icon(Icons.thumb_up_rounded,
                        size: 24, color: lightColorScheme.primary),
                  ),
                  SizedBox(height: 10),
                  BodyText(context.intl.bodyDriverBonusesComments),
                  LabelText('+\$40 ${context.intl.labelDriverBonusesThisMonth}'),
                ],
              ),
            ),
          ],
        ),
        BodyText(context.intl.bodyDriverBonusesHistory, color: lightColorScheme.primary),
        SizedBox(height: 10),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: tiles.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    tiles[i],
                    if (i != tiles.length - 1) 
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Divider(
                          height: 10,
                          thickness: 8,
                          color: lightColorScheme.secondaryContainer,
                        ),
                      ),
                  ],
                );
              },
            ),
            LabelText('22 Sep 2023')
          ],
        ),
        SizedBox(height: 10),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        SecondaryVariantButton(
          text: context.intl.btnDriverProfileBack, 
          onPressed: (){},
          borderColor: lightColorScheme.primary,
        )
      ],
    );
  }
}