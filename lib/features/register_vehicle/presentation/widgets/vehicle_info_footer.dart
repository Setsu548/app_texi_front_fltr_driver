import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';

class VehicleInfoFooter extends StatelessWidget {
  const VehicleInfoFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.5.h,
      width: 75.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.45),
          width: 1.25,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
            child: Icon(
              Icons.info_outline,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            width: 60.w,
            child: Text(
              vehicleInfoFooterDescription.i18n,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
