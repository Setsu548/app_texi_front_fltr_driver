import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class PersonInfoChat extends StatelessWidget {
  const PersonInfoChat({
    super.key,
    required this.name,
    this.statusText,
    this.statusColor, 
    this.avatarImage,                
    this.onTap,
  });

  final String name;
  final String? statusText;
  final Color? statusColor;
  final ImageProvider? avatarImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: lightColorScheme.onSurface.withOpacity(.08),
          backgroundImage: avatarImage,
          child: avatarImage == null
              ? Icon(Icons.person, size: 20, color: lightColorScheme.onSurface)
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(name, maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    width: 8, height: 8,
                    decoration: BoxDecoration(color: statusColor ?? lightColorScheme.surfaceDim, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  LabelText(
                    statusText ?? context.intl.statusPresenceOnline,
                    color: lightColorScheme.onSurface.withOpacity(.85),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    return onTap == null
        ? content
        : InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            child: Padding(padding: const EdgeInsets.all(4), child: content),
          );
  }
}
