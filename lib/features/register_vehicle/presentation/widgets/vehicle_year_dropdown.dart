import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';

class VehicleYearDropdown extends ConsumerWidget {
  const VehicleYearDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> years = ref.watch(listOfYearsProvider);
    final yearSelected = ref.watch(yearSelectedProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vehicleYear.i18n,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.5.h),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.45),
              width: 1.25,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DropdownButton<int>(
              value: yearSelected,
              menuMaxHeight: 19.75.h,
              underline: const SizedBox(),
              items: years.map((year) {
                return DropdownMenuItem<int>(
                  value: year,
                  child: Text(year.toString()),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(yearSelectedProvider.notifier).setYear(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
