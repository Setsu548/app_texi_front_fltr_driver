import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PhotoPickerField extends HookWidget {
  final String label;
  final IconData icon; 
  final VoidCallback onTap;

  const PhotoPickerField({
    super.key,
    required this.label,
    required this.onTap,     
    this.icon = Icons.camera_alt,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() => null, const []);

    return Material( 
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon, 
                color: lightColorScheme.secondaryContainer,
                size: 50,
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
