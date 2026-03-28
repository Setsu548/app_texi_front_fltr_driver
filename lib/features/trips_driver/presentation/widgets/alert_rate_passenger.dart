import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/rate_passenger_provider.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

class AlertRatePassenger extends ConsumerWidget {
  const AlertRatePassenger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripAcceptedInfo = ref.watch(tripAcceptedInfoProvider);
    final currentRate = ref.watch(rateProvider);
    final rateNotifier = ref.read(rateProvider.notifier);
    return AlertDialog(
      title: Text(
        ratePassenger.i18n,
        style: StylesForTexts(context: context).headerStyle(),
        textAlign: TextAlign.center,
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 17.85.w,
              width: 17.85.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Icon(
                Icons.person,
                size: 25.sp,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              '${howWasYourTrip.i18n} ${tripAcceptedInfo?.passengerName}?',
              style: StylesForTexts(context: context).bodyStyle(),
            ),
            SizedBox(height: 2.h),
            Row(
              children: List.generate(5, (index) {
                final isSelected = index < currentRate;
                return IconButton(
                  icon: Icon(
                    isSelected ? Icons.star : Icons.star_border,
                    size: 22.sp,
                  ),
                  onPressed: () => rateNotifier.setRate(index + 1),
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.5),
                );
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(cancel.i18n),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            rateNotifier.reset();
          },
          child: Text(rate.i18n),
        ),
      ],
    );
  }
}
