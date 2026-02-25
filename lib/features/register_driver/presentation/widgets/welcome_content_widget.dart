import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register_driver/presentation/widgets/car_image.widget.dart';

class WelcomeContentWidget extends StatelessWidget {
  const WelcomeContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.85.h),
      width: 85.w,
      height: 65.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: 5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor,
              ),
              child: Center(child: Icon(Icons.verified_user, size: 3.5.h)),
            ),
            SizedBox(height: 1.h),
            Text(
              welcomeDriver.i18n,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.5.sp,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              welcomeDriverDescription.i18n,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 15.75.sp),
            ),
            SizedBox(height: 1.h),
            Container(
              width: 80.w,
              padding: EdgeInsets.symmetric(
                horizontal: 2.5.w,
                vertical: 0.85.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  Text(
                    importantInformation.i18n,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.75.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Icon(
                          Icons.info,
                          size: 25.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                        child: Text(
                          importantMessage.i18n,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.75.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            CarImageWidget(),
          ],
        ),
      ),
    );
  }
}
