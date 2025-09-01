
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class AvatarText extends StatelessWidget {
  final String text;         
  final String? imageUrl;        
  final double radius;           
  final VoidCallback? onTap;  

  const AvatarText({
    Key? key,
    required this.text,
    this.imageUrl,
    this.radius = 30,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundImage: imageUrl != null ? AssetImage(imageUrl!) : null,
            backgroundColor: lightColorScheme.secondary, 
          ),
          SizedBox(height: 8),
          LabelText(text),
        ],
      ),
    );
  }
}
