import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/constants/enums.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';

class VehicleColorSelectorWidget extends ConsumerWidget {
  const VehicleColorSelectorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(vehicleColorProvider);
    final colors = VehicleColor.values;
    return SizedBox(
      height: 12.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        separatorBuilder: (context, index) {
          return SizedBox(width: 4.5.w);
        },
        itemBuilder: (context, index) {
          final colorEnum = colors[index];
          final isSelected = selectedColor == colorEnum;
          return GestureDetector(
            onTap: () {
              ref.read(vehicleColorProvider.notifier).setColor(colorEnum);
            },
            child: Column(
              children: [
                Container(
                  width: 12.w,
                  height: 12.w,
                  decoration: BoxDecoration(
                    color: colorEnum.color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 3.5,
                          )
                        : Border.all(color: Colors.transparent, width: 1),
                  ),
                  child: isSelected
                      ? Center(
                          child: Icon(
                            Icons.check,
                            color: colorEnum == VehicleColor.white
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                            size: 8.w,
                          ),
                        )
                      : null,
                ),
                SizedBox(height: 1.h),
                Text(
                  colorEnum.labelKey.i18n,
                  style: TextStyle(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
