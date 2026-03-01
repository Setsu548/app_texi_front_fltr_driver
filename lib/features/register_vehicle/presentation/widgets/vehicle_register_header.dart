import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class VehicleRegisterHeader extends StatelessWidget {
  final String title;
  final String description;
  const VehicleRegisterHeader({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 21.5.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          description,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 13.75.sp,
          ),
        ),
      ],
    );
  }
}
