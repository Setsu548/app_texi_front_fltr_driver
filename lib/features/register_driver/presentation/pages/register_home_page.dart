import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/widgets/another_elevated_button_widget.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/register_header_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/terms_conditions_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/welcome_content_widget.dart';

class RegisterHomePage extends StatelessWidget {
  const RegisterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RegisterHeaderWidget(),
                WelcomeContentWidget(),
                SizedBox(height: 2.h),
                ElevatedButtonWidget(
                  label: startRegister.i18n,
                  iconImageAfter: Icon(Icons.chevron_right),
                  onPressed: () => context.push(
                    '${AppRouter.registerHomeLocation}/${AppRouter.registerPersonalInfoLocation}',
                  ),
                ),
                SizedBox(height: 2.h),
                TermsConditionsWidget(),
                SizedBox(height: 2.h),
                AnotherElevatedButtonWidget(
                  label: cancel.i18n,
                  onPressed: () {
                    context.go(AppRouter.initialLocation);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
