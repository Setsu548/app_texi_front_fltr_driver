import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/label_textfield_widget.dart';
import 'package:texi/core/widgets/loading_screen.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_color_selector_widget.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_info_footer.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_register_header.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_type_selector_widget.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_year_dropdown.dart';
import 'package:texi/features/register_vehicle/services/register_vehicles_services.dart';

class RegisterVehicleInfoPage extends ConsumerStatefulWidget {
  const RegisterVehicleInfoPage({super.key});

  @override
  ConsumerState<RegisterVehicleInfoPage> createState() =>
      _RegisterVehicleInfoPageState();
}

class _RegisterVehicleInfoPageState
    extends ConsumerState<RegisterVehicleInfoPage> {
  final brandController = TextEditingController();
  final modelController = TextEditingController();
  final plateController = TextEditingController();
  final vinController = TextEditingController();
  final insuranceController = TextEditingController();
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final storage = GetIt.instance<AuthSecureStorageService>();

  VehicleType? selectedType = VehicleType.sedan;

  @override
  void dispose() {
    brandController.dispose();
    modelController.dispose();
    plateController.dispose();
    vinController.dispose();
    insuranceController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(registerVehicleProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(error.toString(), context));
        },
        data: (data) async {
          final storage = GetIt.instance<AuthSecureStorageService>();
          if (data != null && data.success) {
            final vehicleResModel = data.data;
            await storage.saveToken(
              StorageKeys.vehicleRegister,
              vehicleResModel!.uuid,
            );
            if (context.mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(customSnackBar(data.message, context));
            }
          }
        },
      );
    });

    final registerVehicleState = ref.watch(registerVehicleProvider);
    final isLoading = registerVehicleState.isLoading;

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 3.h),
                          VehicleRegisterHeader(
                            title: vehicleData.i18n,
                            description: vehicleDataDesc.i18n,
                          ),
                          SizedBox(height: 3.h),
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                LabelTextfieldWidget(
                                  label: vehicleBrand.i18n,
                                  hintText: '${example.i18n} Toyota',
                                  controller: brandController,
                                  textCapitalization: TextCapitalization.words,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredField.i18n;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 2.h),
                                LabelTextfieldWidget(
                                  label: vehicleModel.i18n,
                                  hintText: '${example.i18n} Corolla',
                                  controller: modelController,
                                  textCapitalization: TextCapitalization.words,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredField.i18n;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 2.h),
                                LabelTextfieldWidget(
                                  label: titleVehicle.i18n,
                                  hintText: '${example.i18n} 01234AAA',
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  controller: titleController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredField.i18n;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 2.h),
                                LabelTextfieldWidget(
                                  label: insurancePhoto.i18n,
                                  hintText: '${example.i18n} 01234AAA',
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  controller: insuranceController,
                                ),
                                SizedBox(height: 2.h),
                                LabelTextfieldWidget(
                                  label: vin.i18n,
                                  hintText: '${example.i18n} 1HGBH41JXMN109186',
                                  controller: vinController,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return requiredField.i18n;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Expanded(child: VehicleYearDropdown()),
                                    SizedBox(width: 4.w),
                                    Expanded(
                                      child: LabelTextfieldWidget(
                                        label: vehiclePlate.i18n,
                                        hintText: vehiclePlateHint.i18n,
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        controller: plateController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return requiredField.i18n;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Text(
                            exteriorColor.i18n,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          VehicleColorSelectorWidget(),
                          SizedBox(height: 1.1.h),
                          Text(
                            vehicleTypeStr.i18n,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          VehicleTypeSelectorWidget(),
                          SizedBox(height: 3.h),
                          Center(child: VehicleInfoFooter()),
                          SizedBox(height: 1.5.h),
                          Center(
                            child: ElevatedButtonWidget(
                              label: continueButton.i18n,
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final vehicleInfo = VehicleEntity(
                                    brand: brandController.text.trim(),
                                    model:
                                        '${modelController.text.trim()} ${ref.read(vehicleTypeProvider).vehicleTypeToSave.trim()}',
                                    year: ref.read(yearSelectedProvider),
                                    licensePlate: plateController.text.trim(),
                                    color: ref
                                        .read(vehicleColorProvider)
                                        .vehicleColorToSave,
                                    tittleDeed: titleController.text.trim(),
                                    vin: vinController.text.trim(),
                                    insurancePolicy: insuranceController.text
                                        .trim(),
                                  );
                                  try {
                                    await RegisterVehiclesServices.registerVehicle(
                                      ref,
                                      vehicleInfo,
                                    );
                                    if (context.mounted) {
                                      context.push(
                                        '${AppRouter.vehicleRegisterHome}/${AppRouter.vehicleRegisterPhotosLocation}',
                                      );
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        customSnackBar(e.toString(), context),
                                      );
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          /* Center(
                            child: AnotherElevatedButtonWidget(
                              label: continueLater.i18n,
                              onPressed: () {
                                context.pop();
                              },
                            ),
                          ),
                          SizedBox(height: 2.5.h), */
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading) const LoadingScreen(),
        ],
      ),
    );
  }
}
