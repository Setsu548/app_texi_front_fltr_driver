import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';

class PhotoCaptureField extends HookWidget {
  final String title;
  final String description;
  final String textButton;
  final IconData icon;
  final Color? iconColor;

  final XFile? initialImage; // 👈 nueva: imagen inicial (externa)
  final ValueChanged<XFile>? onPhotoCaptured; // 👈 callback para devolver imagen

  const PhotoCaptureField({
    super.key,
    required this.title,
    required this.description,
    required this.textButton,
    this.icon = Icons.badge,
    this.iconColor,
    this.initialImage,
    this.onPhotoCaptured,
  });

  @override
  Widget build(BuildContext context) {
    final image = useState<XFile?>(initialImage);
    final picker = ImagePicker();

    Future<void> captureImage() async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        image.value = pickedFile;
        onPhotoCaptured?.call(pickedFile); // 📤 Notifica al padre
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (image.value != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(image.value!.path),
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          )
        else
          Center(
            child: Icon(
              icon,
              size: 60,
              color: iconColor ?? lightColorScheme.surfaceContainerHigh,
            ),
          ),
        const SizedBox(height: 10),

        BodyText(title, color: lightColorScheme.surface),
        const SizedBox(height: 10),
        LabelText(description, color: lightColorScheme.surface),
        const SizedBox(height: 20),

        PrimaryVariantButton(
          text: textButton,
          onPressed: captureImage,
          backgroundColor: lightColorScheme.surfaceContainerHigh,
          colorText: lightColorScheme.onSurface,
        ),
      ],
    );
  }
}
