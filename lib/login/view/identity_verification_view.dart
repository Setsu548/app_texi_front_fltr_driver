import 'dart:convert';
import 'dart:io';

import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_capture_field_widget.dart';
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
import '../bloc/login_bloc.dart';
import '../models/document_info.dart';
import '../utils/bottom_sheet.dart';
import '../utils/format_date.dart';
import '../utils/format_long_date_es.dart';

class IdentityVerificationView extends HookWidget {
  const IdentityVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final frontPhoto = useState<XFile?>(null);
    final backPhoto = useState<XFile?>(null);
    final profilePhoto = useState<XFile?>(null);
    final documentNumberController = useTextEditingController(text: '');
    final selectedDate = useState<DateTime>(DateTime.now());
    final form = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(context.intl.titleTextIdentityVerification, color: lightColorScheme.primary),
          LabelText(context.intl.labelTextIdentityInstruction),
          SizedBox(height: 20),
          CardOnSurface(
            padding: EdgeInsetsGeometry.all(20),
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LabeledTextField(
                controller: documentNumberController,
                label: context.intl.labeledTextFieldIdNumber,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldIdNumberHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabelText('Fecha de expiración', color: lightColorScheme.surface),
              DatePickerField(
                backgroundColor: lightColorScheme.onSecondary,
                borderColor: lightColorScheme.surface,
                arrowColor: lightColorScheme.surface,
                dateText: formatDate(selectedDate.value),
                onTap: () async {
                  final picked = await showBottomSheetDatePicker(
                    lastDate: DateTime(2050),
                    firstDate: DateTime.now(),
                    context,
                  );
                  if (picked != null) {
                    selectedDate.value = picked; 
                  }
                }
              ),
              LabelText(context.intl.labelTextIdNumberInfo, color: lightColorScheme.surface),
              SizedBox(height: 20),
              BodyText(context.intl.bodyTextIdPhoto, color: lightColorScheme.surface),
              SizedBox(height: 10),
              PhotoCaptureField(
                  title: context.intl.photoCaptureFrontDocumentTitle,
                  description:
                      context.intl.photoCaptureFrontDocumentDescription,
                  textButton: context.intl.photoCaptureProfileButton,
                  onPhotoCaptured: (file) => frontPhoto.value = file,
                  initialImage: frontPhoto.value,
                ),
              SizedBox(height: 40),
              PhotoCaptureField(
                  title: context.intl.photoCaptureBackDocumentTitle,
                  description:
                      context.intl.photoCaptureBackDocumentDescription,
                  textButton: context.intl.photoCaptureProfileButton,
                  onPhotoCaptured: (file) => backPhoto.value = file,
                  initialImage: backPhoto.value,
                ),
              SizedBox(height: 40),
              PhotoCaptureField(
                  title: context.intl.photoCaptureProfileTitle,
                  description:
                      context.intl.photoCaptureProfileDescription,
                  textButton: context.intl.photoCaptureProfileButton,
                  onPhotoCaptured: (file) => profilePhoto.value = file,
                  initialImage: profilePhoto.value,
                  icon: Icons.person,
                  iconColor: lightColorScheme.secondaryContainer,
                ),
            ],
          ),
          SizedBox(height: 20),
          PrimaryVariantButton(
            text: context.intl.primaryVariantButtonContinue, 
            onPressed: () async {
              if (form.currentState != null && form.currentState!.validate()) {
                if (profilePhoto.value != null && backPhoto.value != null && frontPhoto.value != null) {
                  final base64ProfileFront = await convertXFileToBase64(frontPhoto.value);
                  final base64ProfileBack = await convertXFileToBase64(backPhoto.value);
                  final base64ProfileProfile = await convertXFileToBase64(profilePhoto.value);
          
                  final documentInfo = DocumentInfo(
                    uuid: context.read<LoginBloc>().state.uuid,
                    documentType: 1, 
                    documentNumber: documentNumberController.text, 
                    frontDocument: base64ProfileFront!, 
                    backDocument: base64ProfileBack!, 
                    faceImage: base64ProfileProfile!, 
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
                            appRouter.push('/security/driver_license_verification');
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
                } else {
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