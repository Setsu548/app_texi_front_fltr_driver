import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoOptions extends HookWidget {
  final String title;
  final String textButtonTake;
  final String textButtonUpload;
  final VoidCallback onTakePhoto;
  final VoidCallback onUploadPhoto;


  const PhotoOptions({
    super.key,
    required this.title,
    required this.textButtonTake,
    required this.textButtonUpload,
    required this.onTakePhoto,    
    required this.onUploadPhoto,         
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
            Icons.upload,
            size: 50,
            color: lightColorScheme.secondaryContainer, 
          ),
        ),
        BodyText(title, color: lightColorScheme.surface),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: PrimaryVariantButton(
                text: textButtonTake,
                onPressed: onTakePhoto,
                backgroundColor: lightColorScheme.surfaceContainerHigh,
                colorText: lightColorScheme.onSurface,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: PrimaryVariantButton(
                text: textButtonUpload,
                onPressed: onUploadPhoto,
                backgroundColor: lightColorScheme.secondaryContainer,
                colorText: lightColorScheme.onSurface,
              ),
            ),
          ],
        )
      ],
    );
  }
}
