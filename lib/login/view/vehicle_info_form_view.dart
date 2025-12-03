import 'dart:convert';
import 'dart:io';

import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/radio_group_row_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/radio_group_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import '../../app/widgets/loading_dialog.dart';
import '../bloc/login_bloc.dart';
import '../models/vehicle_model.dart';

class VehicleInfoFormView extends HookWidget {
  const VehicleInfoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final brand = useState<String?>(null);
    final modelVehicleController = useTextEditingController(text: '');
    final year = useState<int?>(null);
    final vehiclePlateController = useTextEditingController(text: '');
    final vehicleColor = useState<String?>(null);
    final vehicleType = useState<String?>(null);
    final vehicleRuatController = useTextEditingController(text: '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(
          context.intl.titleTextVehicleInfo,
          color: lightColorScheme.primary,
        ),
        LabelText(context.intl.labelTextEnterVehicleData),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledDropdown(
              label: context.intl.labeledDropdownVehicleBrand,
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownVehicleBrandHint,
              onChanged: (value) {
                brand.value = value;
              },
              items: [
                DropdownMenuItem(
                  value: "Toyota",
                  child: BodyText("Toyota", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Suzuki",
                  child: BodyText("Suzuki", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Hyundai",
                  child: BodyText("Hyundai", color: lightColorScheme.surface),
                ),
              ],
            ),
            LabeledTextField(
              controller: modelVehicleController,
              label: context.intl.labeledTextFieldVehicleModel,
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledTextFieldVehicleModelHint,
            ),
            LabeledDropdown(
              label: context.intl.labeledDropdownVehicleYear,
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownVehicleYearHint,
              onChanged: (value) {
                year.value = int.tryParse(value!);
              },
              items: [
                DropdownMenuItem(
                  value: "2018",
                  child: BodyText("2018", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "2019",
                  child: BodyText("2019", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "2020",
                  child: BodyText("2020", color: lightColorScheme.surface),
                ),
              ],
            ),
            LabeledTextField(
              controller: vehiclePlateController,
              label: context.intl.labeledTextFieldVehiclePlate,
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledTextFieldVehiclePlateHint,
            ),
            // RadioGroup(
            //   label: context.intl.radioGroupVehicleColor,
            //   colorLabel: lightColorScheme.surface,
            //   options: ["Blanco", "Negro", "Gris", "Rojo", "Azul", "Verde", "Plata", "Otro"],
            //   onChanged: (value) {
            //     vehicleColor.value = value;
            //     print('Color seleccionado: $value');
            //   },
            // ),
            RadioGroupRow(
              label: context.intl.radioGroupVehicleType,
              colorLabel: lightColorScheme.surface,
              options: ["Sedan", "SUV", "Hatchback"],
              onChanged: (value) {
                vehicleType.value = value;
                print('Color seleccionado: $value');
              },
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextVehicleOwnership,
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 20),
            LabeledTextField(
              controller: vehicleRuatController,
              label: 'CRPVA',
              colorLabel: lightColorScheme.surface,
              hint: 'Ingresar CRPVA del vehículo',
            ),
            SizedBox(height: 20),
            LabelText(
              context.intl.labelTextConfirmVehicleData,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          backgroundColor: lightColorScheme.surfaceBright,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: lightColorScheme.surfaceVariant),
                SizedBox(width: 20),
                Expanded(
                  child: LabelText(
                    context.intl.bodyTextVehicleInfoNotice,
                    color: lightColorScheme.surface,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue,
          onPressed: () async {
            final vehicleInfo = VehicleModel(
              brand: brand.value!,
              color: vehicleColor.value!,
              model: modelVehicleController.text,
              license_plate: vehiclePlateController.text,
              tittle_deed: vehicleRuatController.text,
              year: year.value!,
            );
            context.read<LoginBloc>().add(
              LoginEvent.vehicleRegister(
                vehicleModel: vehicleInfo,
                befor: (res) {
                  showLoadingDialog(context);
                },
                success: (res) {
                  hideLoadingDialog(context);
                  showErrorDialog(
                    context,
                    Icons.check,
                    res.message,
                    title: '',
                    color: lightColorScheme.surfaceDim,
                    onAccept: () {
                      Navigator.pop(context);
                      appRouter.push('/security/vehicle_photo_registration');
                    },
                  );
                },
                error: (err) {
                  hideLoadingDialog(context);
                  showErrorDialog(
                    context,
                    Icons.error_outline,
                    err['details'] ?? 'Error desconocido',
                    title: err['message'] ?? 'Error',
                  );
                },
              ),
            );
          },
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: context.intl.btnCancel,
          onPressed: () {
            appRouter.pop();
          },
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Future<String?> convertXFileToBase64(XFile? file) async {
    if (file == null) return null;
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}
