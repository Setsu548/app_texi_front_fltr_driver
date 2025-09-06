import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoCaptureField extends HookWidget {
  final String title;
  final String description;
  final String textButton;
  final VoidCallback onPressed;

  final IconData icon;
  final Color? iconColor;

  const PhotoCaptureField({
    super.key,
    required this.title,
    required this.description,
    required this.textButton,
    required this.onPressed,
    this.icon = Icons.badge, 
    this.iconColor,          
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() => null, const []);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            icon,
            size: 60,
            color: iconColor ?? lightColorScheme.surfaceContainerHigh, 
          ),
        ),
        SizedBox(height: 10),
        BodyText(title, color: lightColorScheme.surface),
        SizedBox(height: 10),
        LabelText(description, color: lightColorScheme.surface),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: textButton,
          onPressed: onPressed,
          backgroundColor: lightColorScheme.surfaceContainerHigh,
          colorText: lightColorScheme.onSurface,
        )
      ],
    );
  }
}
