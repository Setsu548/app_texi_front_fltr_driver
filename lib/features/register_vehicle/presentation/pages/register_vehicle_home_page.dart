import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';

class RegisterVehicleHomePage extends StatelessWidget {
  const RegisterVehicleHomePage({super.key});

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
          registerVehicleTitle.i18n,
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
                    children: [
                      SizedBox(height: 2.h),
                      // Big card with car icon
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF23231f,
                          ), // estimated dark yellow/grey
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(
                              0xFFFFD600,
                            ).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 32.w,
                              height: 32.w,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFD600),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFFFD600,
                                    ).withValues(alpha: 0.35),
                                    blurRadius: 25,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.local_taxi,
                                  color: Colors.black,
                                  size: 16.w,
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Container(
                              width: 20.w,
                              height: 3,
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFFFD600,
                                ).withValues(alpha: 0.5),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Selección de Vehículo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      Text(
                        'Por favor seleccione una de las siguientes opciones para continuar con el proceso de registro.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12.sp,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // Primary Button
                      ElevatedButtonWidget(
                        label: 'Registrar Vehículo Nuevo',
                        iconImageBefore: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          // Navigate to new vehicle registration
                        },
                      ),
                      SizedBox(height: 2.h),
                      // Secondary Button
                      AnotherElevatedButtonWidget(
                        label: 'Seleccionar Vehículo Registrado',
                        iconImageBefore: const Icon(
                          Icons.featured_play_list_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigate to existing vehicle selection
                        },
                      ),
                      SizedBox(height: 4.h),
                      // Info Box
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1f1f1a),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: const Color(
                              0xFFFFD600,
                            ).withValues(alpha: 0.4),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: const Color(0xFFFFD600),
                              size: 6.w,
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: Text(
                                registerVehicleHomeDes.i18n,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 11.5.sp,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
              // Bottom Action Button
              Padding(
                padding: EdgeInsets.only(bottom: 2.h, top: 1.h),
                child: TextButton(
                  onPressed: () {
                    // Continue later action
                  },
                  child: Text(
                    continueLater.i18n,
                    style: TextStyle(
                      color: Colors.grey[500],
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
