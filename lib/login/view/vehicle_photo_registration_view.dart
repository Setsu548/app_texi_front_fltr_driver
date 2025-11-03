import 'dart:convert';
import 'dart:io';

import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_picker_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/models/vehicle_images_card.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';

import '../../app/widgets/loading_dialog.dart';
import '../bloc/login_bloc.dart';

class VehiclePhotoRegistrationView extends HookWidget {
  const VehiclePhotoRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    final frontPhoto = useState<XFile?>(null);
    final backPhoto = useState<XFile?>(null);
    final leftSidePhoto = useState<XFile?>(null);
    final rightSidePhone = useState<XFile?>(null);

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(context.intl.titleTextVehiclePhotos, color: lightColorScheme.primary),
            SizedBox(height: 20),
            CardOnSurface(
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: EdgeInsetsGeometry.all(20),
              children: [
                LabelText(
                  context.intl.labelTextVehiclePhotosInstruction,
                  color: lightColorScheme.surface,
                ),
                SizedBox(height: 20),
                CardPrimaryContainer(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info, color: lightColorScheme.surfaceVariant),
                        SizedBox(width: 20),
                        Expanded(
                          child: 
                            LabelText(context.intl.cardPrimaryContainerVehiclePhotosInfo,
                            color: lightColorScheme.surface)
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                BodyText(context.intl.bodyTextFront, color: lightColorScheme.secondary),
                PhotoPickerField(label: context.intl.photoPickerTapLabel, onPhotoCaptured: (file) => frontPhoto.value = file),
                BodyText(context.intl.bodyTextLeftSide, color: lightColorScheme.secondary),
                PhotoPickerField(label: context.intl.photoPickerTapLabel, onPhotoCaptured: (file) => leftSidePhoto.value = file),
                BodyText(context.intl.bodyTextRightSide, color: lightColorScheme.secondary),
                PhotoPickerField(label: context.intl.photoPickerTapLabel, onPhotoCaptured: (file) => rightSidePhone.value = file),
                BodyText(context.intl.bodyTextBack, color: lightColorScheme.secondary),
                PhotoPickerField(label: context.intl.photoPickerTapLabel, onPhotoCaptured: (file) => backPhoto.value = file)
              ],
            ),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: context.intl.primaryVariantButtonContinue, 
              onPressed: () async {
                if (rightSidePhone.value != null && leftSidePhoto.value != null && backPhoto.value != null && frontPhoto.value != null) {
                  final base64ProfileFront = await convertXFileToBase64(frontPhoto.value);
                  final base64ProfileBack = await convertXFileToBase64(backPhoto.value);
                  final base64ProfileLeftSide = await convertXFileToBase64(leftSidePhoto.value);
                  final base64ProfileRightSide = await convertXFileToBase64(rightSidePhone.value);
    
                  final documentInfo = VehicleImagesCard(
                    carId: state.cartId!, 
                    cars: [
                      Card(image: base64ProfileFront!, image_name: 'frontal'),
                      Card(image: base64ProfileLeftSide!, image_name: 'izquiedo'),
                      Card(image: base64ProfileRightSide!, image_name: 'derecho'),
                      Card(image: base64ProfileBack!, image_name: 'trasera')
                    ]
                  );
                  context.read<LoginBloc>().add(LoginEvent.vehicleImagesCar(
                    vehicleImagesCar: documentInfo,
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
                            appRouter.push('/security/registration_confirmation_vehicle');
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
            ),
            SizedBox(height: 20),
            SecondaryVariantButton(
              text: context.intl.btnCancel,
              onPressed: (){
                appRouter.pop();
              }
            ),
            SizedBox(height: 30),
          ],
        );
      },
    );
  }

  Future<String?> convertXFileToBase64(XFile? file) async {
    if (file == null) return null;
    final bytes = await File(file.path).readAsBytes();
    return base64Encode(bytes);
  }
}