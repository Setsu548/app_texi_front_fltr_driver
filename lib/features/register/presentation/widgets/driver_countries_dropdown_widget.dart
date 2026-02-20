import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register/presentation/providers/driver_form_provider.dart';

class DriverCountriesDropdownWidget extends ConsumerStatefulWidget {
  const DriverCountriesDropdownWidget({super.key});

  @override
  ConsumerState<DriverCountriesDropdownWidget> createState() =>
      _DriverCountriesDropdownWidgetState();
}

class _DriverCountriesDropdownWidgetState
    extends ConsumerState<DriverCountriesDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    final countries = ref.watch(countriesListProvider);
    final countryValue = ref.watch(localCountryProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          code.i18n,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.15.h),
        Container(
          width: 25.w,
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
            child: DropdownButton<Country>(
              value: countryValue,
              underline: const SizedBox(),
              isExpanded: true,
              menuMaxHeight: 25.h,
              items: countries.map((country) {
                return DropdownMenuItem<Country>(
                  value: country,
                  child: Row(
                    children: [Text(country.flag), Text(country.dialCode)],
                  ),
                );
              }).toList(),
              onChanged: (country) {
                if (country != null) {
                  ref.read(localCountryProvider.notifier).setCountry(country);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
