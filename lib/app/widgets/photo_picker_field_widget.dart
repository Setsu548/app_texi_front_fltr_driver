import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class PhotoPickerField extends HookWidget {
  final String label;
  final IconData icon;
  final XFile? initialImage; // 👈 imagen inicial (por ejemplo, cargada de la base o backend)
  final ValueChanged<XFile>? onPhotoCaptured; // 👈 callback para devolver imagen

  const PhotoPickerField({
    super.key,
    required this.label,
    this.icon = Icons.camera_alt,
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
        onPhotoCaptured?.call(pickedFile); // 🔔 Notifica al padre
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: captureImage,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 👇 Si ya hay imagen, la mostramos
              if (image.value != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    File(image.value!.path),
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                )
              else
                Icon(
                  icon,
                  color: lightColorScheme.secondaryContainer,
                  size: 80,
                ),
              const SizedBox(height: 10),
              LabelText(label, color: lightColorScheme.secondaryContainer),
            ],
          ),
        ),
      ),
    );
  }
}
