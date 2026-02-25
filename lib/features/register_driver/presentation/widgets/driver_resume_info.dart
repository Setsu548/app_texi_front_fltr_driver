import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class DriverResumeInfo extends ConsumerWidget {
  const DriverResumeInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 40.5.h,
      width: 85.w,
      padding: EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 2.3.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                driverResumeInfo.i18n,
                style: StylesForTexts(context: context).headerStyleSmall(),
              ),
              Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30.w,
                child: Text(
                  personalInformation.i18n,
                  style: StylesForTexts(context: context).bodyStyle(),
                ),
              ),
              TextButton(onPressed: () {}, child: Text(edit.i18n)),
            ],
          ),
          Divider(
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
          ),
          Container(
            height: 18.75.h,
            width: 75.w,
            padding: EdgeInsets.symmetric(horizontal: 5.3.w, vertical: 2.41.h),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SizedBox(width: 20.w, child: Text(names.i18n)),
                    Text(
                      driverDemo.fullName,
                      style: StylesForTexts(context: context).bodyStyle(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w, child: Text(ciDNI.i18n)),
                    Text(
                      driverDemo.ci,
                      style: StylesForTexts(context: context).bodyStyle(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w, child: Text(phone.i18n)),
                    Text(
                      driverDemo.phone,
                      style: StylesForTexts(context: context).bodyStyle(),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w, child: Text(email.i18n)),
                    Text(
                      driverDemo.email,
                      style: StylesForTexts(context: context).bodyStyle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 20.w, child: Text(category.i18n)),
              Text(
                driverDemo.category,
                style: StylesForTexts(context: context).bodyStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DriverResume {
  final String fullName;
  final String ci;
  final String phone;
  final String email;
  final String category;

  DriverResume({
    required this.fullName,
    required this.ci,
    required this.phone,
    required this.email,
    required this.category,
  });
}

final driverDemo = DriverResume(
  fullName: 'Juan Perez',
  ci: '12345678',
  phone: '12345678',
  email: 'juan.perez@example.com',
  category: 'A',
);
