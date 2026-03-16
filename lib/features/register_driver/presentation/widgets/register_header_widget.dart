import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 22.w,
      /* decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withValues(alpha: 0.5),
            Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.5),
            Theme.of(context).scaffoldBackgroundColor,
          ],
          radius: 0.9,
          center: Alignment.center,
          stops: [0.0, 0.2, 0.5, 0.7],
        ),
      ), */
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_taxi,
            size: 5.h,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            texiRegister.i18n,
            style: StylesForTexts(context: context).headerStyle(),
          ),
        ],
      ),
    );
  }
}
