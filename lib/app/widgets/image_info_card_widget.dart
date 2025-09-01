import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';
import 'label_text_widget.dart';

class ImageInfoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const ImageInfoCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          width: 140, 
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: lightColorScheme.surface,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: isSelected
              ? lightColorScheme.surfaceVariant
              : lightColorScheme.secondaryContainer
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: Image.asset(
                  imageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              BodyText(title, color: lightColorScheme.onSurface, textAlign: TextAlign.center,),
              LabelText(description),
              BodyText('\$${price}', color: lightColorScheme.surfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
