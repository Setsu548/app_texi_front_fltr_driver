import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/filter_date_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/trip_summary_card_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/navigation/utils/bottom_sheet.dart';
import 'package:app_texi_fltr_driver/navigation/utils/format_date.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class TravelHistoryView extends HookWidget {
  const TravelHistoryView({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedDateFrom = useState<DateTime>(
      DateTime.now().subtract(const Duration(days: 1)),
    );
    final selectedDateTo = useState<DateTime>(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          context.intl.titleTravelHistoryView,
          color: lightColorScheme.primary,
        ),
        Divider(
          thickness: 8,               
          color: lightColorScheme.secondaryContainer,
          height: 40,                  
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(context.intl.labelTravelHistoryCompletedTrips),
            LabelText('38', color: lightColorScheme.primary)
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
                BodyText(context.intl.bodyTravelHistoryFilterByDate),
                GestureDetector(
                  onTap: () {}, 
                  child: BodyText(
                    context.intl.linkTravelHistoryApply,
                    color: lightColorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            Row(
              children: [
                FilterDateField(
                  label: context.intl.labelTravelHistoryFrom,
                  dateText: formatDate(selectedDateFrom.value),
                  onTap: () async {
                    final picked = await showBottomSheetDatePicker(
                      context,
                      initialDate: selectedDateFrom.value,
                    );
                    if (picked != null) {
                      selectedDateFrom.value = picked; 
                    }
                  }
                ),
                SizedBox(width: 12),
                FilterDateField(
                  label: context.intl.labelTravelHistoryTo,
                  dateText: formatDate(selectedDateTo.value),
                  onTap: () async {
                    final picked = await showBottomSheetDatePicker(
                      context,
                      initialDate: selectedDateTo.value,
                    );
                    if (picked != null) {
                      selectedDateTo.value = picked; 
                    }
                  }
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        TripHistoryCard(
          dateText: '29 Julio, 2025',
          priceText: '25.50 Bs.',
          originTime: '08:15 AM',
          duration: '25 min',
          distance: '4.8 km',
          originDescription: 'Av. Ballivián, Calacoto',
          destinationDescription: 'Plaza Abaroa, Sopocachi',
        ),
        SizedBox(height: 20),
        TripHistoryCard(
          dateText: '29 Julio, 2025',
          priceText: '18.75 Bs.',
          originTime: '10:45 AM',
          duration: '18 min',
          distance: '3.2 km',
          originDescription: 'Calle 21, Achumani',
          destinationDescription: 'Av. 6 de Agosto, San Jorge',
        ),
        SizedBox(height: 20),
        TripHistoryCard(
          dateText: '29 Julio, 2025',
          priceText: '45.25 Bs.',
          originTime: '02:30 PM',
          duration: '32 min',
          distance: '7.5 km',
          originDescription: 'Av. Arce, Central',
          destinationDescription: 'Calle 15, Obrajes',
        ),
        SizedBox(height: 20),
        TripHistoryCard(
          dateText: '29 Julio, 2025',
          priceText: '12.30 Bs.',
          originTime: '05:15 PM',
          duration: '22 min',
          distance: '5.1 km',
          originDescription: 'Megacenter, Irpavi',
          destinationDescription: 'Plaza Venezuela, Miraflores',
        ),
        SizedBox(height: 20),
        TripHistoryCard(
          dateText: '25 Julio, 2025',
          priceText: '35.00 Bs.',
          originTime: '09:20 AM',
          duration: '40 min',
          distance: '9.3 km',
          originDescription: 'Aeropuerto El Alto',
          destinationDescription: 'Hotel Los Tajibos, Calacoto',
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