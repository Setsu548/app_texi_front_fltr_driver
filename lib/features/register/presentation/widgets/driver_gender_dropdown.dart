import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register/presentation/providers/diver_form_provider.dart';

class DriverGenderDropdown extends ConsumerStatefulWidget {
  const DriverGenderDropdown({super.key});

  @override
  ConsumerState<DriverGenderDropdown> createState() =>
      _DriverGenderDropdownState();
}

class _DriverGenderDropdownState extends ConsumerState<DriverGenderDropdown> {
  @override
  Widget build(BuildContext context) {
    final genderValue = ref.watch(genderProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gender.i18n,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.15.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          decoration: BoxDecoration(
            color: Color(0xFF262626),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.45),
              width: 1.25,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: DropdownButton<Gender>(
              value: genderValue,
              underline: const SizedBox(),
              isExpanded: true,
              menuMaxHeight: 25.h,
              items: Gender.values.map((gender) {
                return DropdownMenuItem<Gender>(
                  value: gender,
                  child: Row(children: [Text(gender.genders)]),
                );
              }).toList(),
              onChanged: (gender) {
                if (gender != null) {
                  ref.read(genderProvider.notifier).setGender(gender);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
