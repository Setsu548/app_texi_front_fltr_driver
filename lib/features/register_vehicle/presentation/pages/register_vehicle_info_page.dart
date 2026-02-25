import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/label_textfield_widget.dart';

enum VehicleColor {
  white(Colors.white, colorWhite),
  black(Color(0xFF1f1f1a), colorBlack),
  gray(Color(0xFF9CA3AF), colorGray),
  red(Color(0xFFEF4444), colorRed),
  blue(Color(0xFF3B82F6), colorBlue);

  final Color color;
  final String labelKey;
  const VehicleColor(this.color, this.labelKey);
}

enum VehicleType {
  sedan(Icons.directions_car_outlined, typeSedan),
  hatchback(Icons.directions_car, typeHatchback),
  suv(Icons.airport_shuttle_outlined, typeSUV),
  minivan(Icons.airport_shuttle, typeMinivan);

  final IconData icon;
  final String labelKey;
  const VehicleType(this.icon, this.labelKey);
}

class RegisterVehicleInfoPage extends StatefulWidget {
  const RegisterVehicleInfoPage({super.key});

  @override
  State<RegisterVehicleInfoPage> createState() =>
      _RegisterVehicleInfoPageState();
}

class _RegisterVehicleInfoPageState extends State<RegisterVehicleInfoPage> {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final plateController = TextEditingController();

  VehicleColor? selectedColor = VehicleColor.white;
  VehicleType? selectedType = VehicleType.sedan;

  @override
  void dispose() {
    brandController.dispose();
    modelController.dispose();
    yearController.dispose();
    plateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: Text(
          vehicleInfoTitle.i18n,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h),
                      // Progress Bar
                      Text(
                        step2Of5.i18n,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD600),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2A2A2A), // Dark track
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      // Titles
                      Text(
                        vehicleData.i18n,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      Text(
                        vehicleDataDesc.i18n,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      // TextFields
                      Theme(
                        data: Theme.of(
                          context,
                        ).copyWith(primaryColor: Colors.white),
                        child: Column(
                          children: [
                            LabelTextfieldWidget(
                              label: vehicleBrand.i18n,
                              hintText: vehicleBrandHint.i18n,
                              controller: brandController,
                            ),
                            SizedBox(height: 2.h),
                            LabelTextfieldWidget(
                              label: vehicleModel.i18n,
                              hintText: vehicleModelHint.i18n,
                              controller: modelController,
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              children: [
                                Expanded(
                                  child: LabelTextfieldWidget(
                                    label: vehicleYear.i18n,
                                    hintText: vehicleYearHint.i18n,
                                    controller: yearController,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(width: 4.w),
                                Expanded(
                                  child: LabelTextfieldWidget(
                                    label: vehiclePlate.i18n,
                                    hintText: vehiclePlateHint.i18n,
                                    controller: plateController,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 3.h),
                      // Colors
                      Text(
                        exteriorColor.i18n,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: VehicleColor.values.map((colorEnum) {
                          final isSelected = selectedColor == colorEnum;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = colorEnum;
                              });
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
                                            color: const Color(0xFFFFD600),
                                            width: 2.5,
                                          )
                                        : Border.all(
                                            color: Colors.transparent,
                                            width: 1,
                                          ),
                                  ),
                                  child: isSelected
                                      ? Center(
                                          child: Icon(
                                            Icons.check,
                                            color:
                                                colorEnum == VehicleColor.white
                                                ? Colors.black
                                                : Colors.white,
                                            size: 6.w,
                                          ),
                                        )
                                      : null,
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  colorEnum.labelKey.i18n,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 3.h),
                      // Vehicle Type
                      Text(
                        vehicleTypeStr.i18n,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Wrap(
                        spacing: 3.w,
                        runSpacing: 2.h,
                        children: VehicleType.values.map((typeEnum) {
                          final isSelected = selectedType == typeEnum;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedType = typeEnum;
                              });
                            },
                            child: Container(
                              width: 42.w,
                              padding: EdgeInsets.symmetric(vertical: 1.5.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(
                                        0xFFFFD600,
                                      ).withValues(alpha: 0.1)
                                    : const Color(0xFF1f2937),
                                borderRadius: BorderRadius.circular(10),
                                border: isSelected
                                    ? Border.all(
                                        color: const Color(0xFFFFD600),
                                        width: 1.5,
                                      )
                                    : Border.all(
                                        color: Colors.grey.withValues(
                                          alpha: 0.1,
                                        ),
                                        width: 1.5,
                                      ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    typeEnum.icon,
                                    color: isSelected
                                        ? const Color(0xFFFFD600)
                                        : Colors.grey[400],
                                    size: 5.w,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    typeEnum.labelKey.i18n,
                                    style: TextStyle(
                                      color: isSelected
                                          ? const Color(0xFFFFD600)
                                          : Colors.grey[400],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11.5.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 3.h),
                      // Property Card
                      Text(
                        propertyCard.i18n,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      GestureDetector(
                        onTap: () {
                          // Upload action
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF1f2937,
                            ).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.cloud_upload_outlined,
                                  color: const Color(0xFFFFD600),
                                  size: 10.w,
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  uploadPhotoOrDoc.i18n,
                                  style: TextStyle(
                                    color: Colors.blue[300],
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 1.h),
                                Text(
                                  jpgPngPdfLimit.i18n,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
              // Bottom Buttons
              ElevatedButtonWidget(
                label: continueButton.i18n,
                onPressed: () {
                  // Continue action
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, top: 1.h),
                child: TextButton(
                  onPressed: () {
                    // Continue later action
                  },
                  child: Text(
                    continueLater.i18n,
                    style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
