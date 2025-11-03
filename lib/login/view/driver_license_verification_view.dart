import 'dart:convert';
import 'dart:io';

import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/widgets/date_picker_field_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/photo_capture_field_widget.dart';
import '../bloc/login_bloc.dart';
import '../models/document_info.dart';
import '../utils/bottom_sheet.dart';
import '../utils/format_date.dart';
import '../utils/format_long_date_es.dart';

class DriverLicenseVerificationView extends HookWidget {
  const DriverLicenseVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final frontPhoto = useState<XFile?>(null);
    final backPhoto = useState<XFile?>(null);
    final licenseCategory = useState<String?>(null);
    final selectedDate = useState<DateTime>(DateTime.now());
    final form = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(context.intl.titleTextDriverLicenseVerification, color: lightColorScheme.primary),
          LabelText(context.intl.labelTextDriverLicenseInstruction),
          SizedBox(height: 20),
          CardOnSurface(
            padding: EdgeInsetsGeometry.all(20),
            children: [
              LabeledDropdown(
                label: context.intl.labeledDropdownLicenseCategory, 
                colorLabel: lightColorScheme.surface,
                hint: context.intl.labeledDropdownLicenseCategoryHint, 
                onChanged: (value) => licenseCategory.value = value,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
                items: [
                  DropdownMenuItem(
                    value: 'Categoría "A"',
                    child: BodyText('Categoría "A"', color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: 'Categoría "B"',
                    child: BodyText('Categoría "B"', color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: 'Categoría "C"',
                    child: BodyText('Categoría "C"', color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: 'Categoría "C1"',
                    child: BodyText('Categoría "C1"', color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: 'Categoría "P"',
                    child: BodyText('Categoría "P"', color: lightColorScheme.surface),
                  ),
                ]
              ),
              LabelText('Fecha de expiración',color: lightColorScheme.surface),
              DatePickerField(
                backgroundColor: lightColorScheme.onSecondary,
                borderColor: lightColorScheme.surface,
                arrowColor: lightColorScheme.surface,
                dateText: formatDate(selectedDate.value),
                onTap: () async {
                  final picked = await showBottomSheetDatePicker(
                    context,
                    lastDate: DateTime(2050),
                    firstDate: DateTime.now(),
                  );
                  if (picked != null) {
                    selectedDate.value = picked; 
                  }
                }
              ),
            ],
          ),
          
          SizedBox(height: 20),
          CardOnSurface(
            padding: EdgeInsetsGeometry.all(20),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BodyText(context.intl.bodyTextDriverLicensePhoto, color: lightColorScheme.surface),
              SizedBox(height: 20),
              PhotoCaptureField(
                  title: context.intl.photoOptionsFrontTitle,
                  description:
                      context.intl.photoCaptureFrontDocumentDescription,
                  textButton: context.intl.photoOptionsFrontButtonUpload,
                  onPhotoCaptured: (file) => frontPhoto.value = file,
                  initialImage: frontPhoto.value,
                ),
              SizedBox(height: 40),
              PhotoCaptureField(
                  title: context.intl.photoOptionsBackTitle,
                  description: context.intl.photoOptionsFrontButtonTake,
                  textButton: context.intl.photoOptionsFrontButtonUpload,
                  onPhotoCaptured: (file) => backPhoto.value = file,
                  initialImage: backPhoto.value,
                ),
            ],
          ),
          SizedBox(height: 20),
          PrimaryVariantButton(
            text: context.intl.primaryVariantButtonContinue, 
            onPressed: () async {
              if (form.currentState != null && form.currentState!.validate()) {
                if (backPhoto.value != null && frontPhoto.value != null) {
                  final base64ProfileFront = await convertXFileToBase64(frontPhoto.value);
                  final base64ProfileBack = await convertXFileToBase64(backPhoto.value);

                  final documentInfo = DocumentInfo(
                    uuid: context.read<LoginBloc>().state.uuid,
                    documentType: 6, 
                    documentNumber: licenseCategory.value!, 
                    frontDocument: base64ProfileFront!, 
                    backDocument: base64ProfileBack!, 
                    faceImage: '', 
                    expireDate: formatShortDateEs(selectedDate.value)
                  );
                  context.read<LoginBloc>().add(LoginEvent.documentInfo(
                    documentInfo: documentInfo,
                    befor: (res){
                      showLoadingDialog(context);
                    },
                    success: (res){
                        hideLoadingDialog(context);
                        showErrorDialog(
                          context,
                          Icons.check,
                          res.message,
                          title: '',
                          color: lightColorScheme.surfaceDim,
                          onAccept: (){
                            Navigator.pop(context);
                            appRouter.push('/security/registration_confirmation_person');
                          }
                        );
                    },
                    error: (err){
                      hideLoadingDialog(context);
                      showErrorDialog(
                        context,
                        Icons.error_outline,
                        err['details'] ?? 'Error desconocido',
                        title: err['message'] ?? 'Error',
                      );
                    }
                  ));
                }else {
                        showErrorDialog(
                          context,
                          Icons.warning,
                          'No se ha tomado la foto',
                        );
                      }
              }
            }
          ),
          SizedBox(height: 20),
          SecondaryVariantButton(
            text: context.intl.secondaryVariantButtonCancel, 
            onPressed: (){
              appRouter.pop();
            }
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Future<String?> convertXFileToBase64(XFile? file) async {
    if (file == null) return null;
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}