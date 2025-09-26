import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/earnings_date_type_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/metric_progress_tile.dart';
import 'package:app_texi_fltr_driver/app/widgets/month_selector_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/trip_list_tile_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/navigation/utils/bottom_sheet.dart';
import 'package:app_texi_fltr_driver/navigation/utils/format_long_date_es.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class EarningsView extends HookWidget {
  const EarningsView({super.key});

  @override
  Widget build(BuildContext context) {

    final trips = <TripListTile>[
      TripListTile(dateLabel: 'Hoy, 15:30', origin: 'Plaza Principal', destination: 'Aeropuerto', priceText: 'Bs. 85.25'),
      TripListTile(dateLabel: 'Hoy, 13:15', origin: 'Centro Comercial', destination: 'Universidad', priceText: 'Bs. 42.75'),
      TripListTile(dateLabel: 'Hoy, 10:45', origin: 'Residencial Las Palmas', destination: 'Hospital', priceText: 'Bs. 63.50'),
      TripListTile(dateLabel: 'Ayer, 19:20', origin: 'Terminal', destination: 'Hotel Continental', priceText: 'Bs. 95.00'),
    ];
        
    final selectedIndex = useState<int?>(null);

    final dates = [
      'Diario',
      'Semanal',
      'Mensual'
    ];

    final selectedDate = useState<DateTime>(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          context.intl.titleDriverEarningsView,
          color: lightColorScheme.primary,
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox()
            ),
            MonthSelectorChip(
              label: formatLongDateEs(selectedDate.value),
              onTap: ()  async {
                final picked = await showBottomSheetDatePicker(
                  context,
                  initialDate: selectedDate.value,
                );
                if (picked != null) {
                  selectedDate.value = picked; 
                }
              }
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(context.intl.bodyDriverEarningsTotal, color: lightColorScheme.primary),
                    BodyText(context.intl.bodyDriverEarningsEarnings, color: lightColorScheme.primary),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TitleText(
                          'Bs. 8,745.50',
                          color: lightColorScheme.primary,
                        ),
                        SizedBox(width: 8),
                        LabelText(context.intl.labelDriverEarningsThisMonth),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    BodyText('+12%', color: lightColorScheme.surfaceDim),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_outward, color: lightColorScheme.surfaceDim)
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: List.generate(dates.length, (i) {
            final selected = selectedIndex.value == i;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: EarningsDateType(
                  text: dates[i],
                  isSelected: selected,
                  onTap: () => selectedIndex.value = i,
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(context.intl.bodyDriverEarningsBreakdownByDay, color: lightColorScheme.primary)
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(context.intl.bodyDriverEarningsPerformanceMetrics, color: lightColorScheme.primary),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyText(context.intl.bodyDriverEarningsTripsCompleted),
                      TitleText('124', color: lightColorScheme.primary,),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyText(context.intl.bodyDriverEarningsKilometersTraveled),
                      TitleText('1,450 km', color: lightColorScheme.primary),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyText(context.intl.bodyDriverEarningsAvgPerTrip),
                      TitleText('Bs. 70.53', color: lightColorScheme.primary),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BodyText(context.intl.bodyDriverEarningsAvgPerKm),
                      TitleText('Bs. 6.03', color: lightColorScheme.primary),
                    ],
                  ),
                ),
              ],
            ),
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
                BodyText(context.intl.bodyDriverEarningsLastTrips, color: lightColorScheme.primary),
                LinkTextPrimary(context.intl.linkDriverEarningsSeeAll, onTap: (){}, colorText: lightColorScheme.primary)
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: trips.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    trips[i],
                    if (i != trips.length - 1) 
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
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyDriverEarningsComparisonPrevPeriod,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 20),
            MetricProgressTile(
              title: context.intl.labelDriverEarningsMetricEarnings,
              progress: 0.78,               
              deltaText: '+15.3%',
            ),
            SizedBox(height: 20),
            MetricProgressTile(
              title: context.intl.labelDriverEarningsMetricTrips,
              progress: 0.68,               
              deltaText: '+8.7%',
            ),
            SizedBox(height: 20),
            MetricProgressTile(
              title: context.intl.labelDriverEarningsMetricKilometers,
              progress: 0.58,               
              deltaText: '-3.2%',
              deltaColor: lightColorScheme.error,
              deltaIcon: Icons.arrow_downward,
            ),
          ],
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