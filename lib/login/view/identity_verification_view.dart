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

import '../bloc/login_bloc.dart';
import '../models/document_info.dart';

class IdentityVerificationView extends HookWidget {
  const IdentityVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final frontPhoto = useState<XFile?>(null);
    final backPhoto = useState<XFile?>(null);
    final profilePhoto = useState<XFile?>(null);
    final documentNumberController = useTextEditingController(text: '');

    return Column(
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
              hint: context.intl.labeledTextFieldIdNumberHint
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
            final base64ProfileFront = await convertXFileToBase64(frontPhoto.value);
            final base64ProfileBack = await convertXFileToBase64(backPhoto.value);
            final base64ProfileProfile = await convertXFileToBase64(profilePhoto.value);

            final documentInfo = DocumentInfo(
              documentType: 1, 
              documentNumber: documentNumberController.text, 
              frontDocument: base64ProfileFront!, 
              backDocument: base64ProfileBack!, 
              faceImage: base64ProfileProfile!, 
              expireDate: "2029-08-20"
            );
            context.read<LoginBloc>().add(LoginEvent.documentInfo(
              documentInfo: documentInfo,
              success: (res){
                if (profilePhoto.value != null) {

                } else {
                  print('⚠️ No se ha tomado la foto');
                }
                appRouter.push('/security/driver_license_verification');
              },
              error: (err){

              }
            ));
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonContinueLater, onPressed: (){})
      ],
    );
  }
  Future<String?> convertXFileToBase64(XFile? file) async {
    if (file == null) return null;
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}