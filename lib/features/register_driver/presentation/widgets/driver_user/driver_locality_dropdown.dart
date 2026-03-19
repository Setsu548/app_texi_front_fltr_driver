import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/widgets/loading_component.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_form_provider.dart';

class DriverLocalityDropdown extends ConsumerWidget {
  const DriverLocalityDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localities = ref.watch(localitiesListProvider);
    final localitySelected = ref.watch(localitySelectedProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locality.i18n,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.15.h),
        Container(
          width: 40.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
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
            child: localities.when(
              data: (data) {
                if (data.isEmpty) {
                  return const SizedBox();
                }

                final value = data.contains(localitySelected)
                    ? localitySelected
                    : data.first;

                return DropdownButton(
                  value: value,
                  underline: const SizedBox(),
                  isExpanded: true,
                  menuMaxHeight: 25.h,
                  hint: Text(locality.i18n),
                  dropdownColor: Theme.of(context).colorScheme.tertiary,
                  items: data
                      .map(
                        (loc) =>
                            DropdownMenuItem(value: loc, child: Text(loc.name)),
                      )
                      .toList(),
                  onChanged: (value) {
                    ref
                        .read(localitySelectedProvider.notifier)
                        .setLocality(value!);
                  },
                );
              },
              loading: () => Center(child: loadingComponent()),
              error: (error, stack) => Center(child: Text('Error')),
            ),
          ),
        ),
      ],
    );
  }
}
