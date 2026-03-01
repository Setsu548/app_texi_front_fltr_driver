import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';

class VehicleTypeSelectorWidget extends ConsumerWidget {
  const VehicleTypeSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(vehicleTypeProvider);
    return Wrap(
      spacing: 3.w,
      runSpacing: 2.h,
      children: VehicleType.values.map((typeEnum) {
        final isSelected = selectedType == typeEnum;
        return GestureDetector(
          onTap: () {
            ref.read(vehicleTypeProvider.notifier).setType(typeEnum);
          },
          child: Container(
            width: 42.w,
            padding: EdgeInsets.symmetric(vertical: 1.5.h),
            decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                  : Theme.of(
                      context,
                    ).colorScheme.tertiary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(10),
              border: isSelected
                  ? Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.85,
                    )
                  : Border.all(
                      color: Colors.grey.withValues(alpha: 0.1),
                      width: 1.5,
                    ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  typeEnum.icon,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(
                          context,
                        ).colorScheme.secondary.withValues(alpha: 0.75),
                  size: 21.5.sp,
                ),
                SizedBox(width: 2.w),
                Text(
                  typeEnum.labelKey.i18n,
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.75),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.75.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
