import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/photo_card.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/warning_banner.dart';

class RegisterVehiclePhotosPage extends StatelessWidget {
  const RegisterVehiclePhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFD600)),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: Text(
          vehiclePhotos.i18n,
          style: TextStyle(
            color: const Color(0xFFFFD600),
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehiclePhotosDescription.i18n,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.5.h),
              WarningBanner(),
              SizedBox(height: 3.h),
              PhotoCard(
                title: vehicleFront.i18n,
                icon: Icons.directions_car_outlined,
              ),
              SizedBox(height: 2.h),
              PhotoCard(
                title: vehicleLeftSide.i18n,
                icon: Icons.view_sidebar_outlined,
              ),
              SizedBox(height: 2.h),
              PhotoCard(
                title: vehicleRightSide.i18n,
                icon: Icons.view_sidebar_outlined,
              ),
              SizedBox(height: 2.h),
              PhotoCard(
                title: vehicleBackSide.i18n,
                icon: Icons.airport_shuttle_outlined,
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1f2937),
          border: Border(
            top: BorderSide(
              color: Colors.grey.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButtonWidget(
              label: continueButton.i18n,
              onPressed: () {
                // TODO: Implement continue
              },
              width: 90.w,
            ),
            SizedBox(height: 1.5.h),
            AnotherElevatedButtonWidget(
              label: continueLater.i18n,
              onPressed: () {
                // TODO: Implement continue later
              },
              width: 90.w,
            ),
          ],
        ),
      ),
    );
  }
}
