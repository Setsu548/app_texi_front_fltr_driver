import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final bool isSelected;

  const SideMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        isSelected ? lightColorScheme.primary : Colors.transparent;

    final Color textColor =
        isSelected ? lightColorScheme.primary : (color ?? lightColorScheme.onSurface);

    final Color iconColor =
        isSelected ? lightColorScheme.primary : (color ?? lightColorScheme.onSurface);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.5, // 👈 más delgado
        ),
        borderRadius: BorderRadius.circular(6),
        color: isSelected
            ? lightColorScheme.primary.withOpacity(0.08)
            : Colors.transparent,
      ),
      child: ListTile(
        dense: true, // 👈 reduce altura interna
        minLeadingWidth: 28, // 👈 menos espacio entre ícono y texto
        horizontalTitleGap: 10, // 👈 reduce espacio entre icono y texto
        visualDensity: const VisualDensity(vertical: -2), // 👈 compacta más
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        leading: Icon(icon, color: iconColor, size: 22), // 👈 ícono más pequeño
        title: BodyText(
          text,
          color: textColor,
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
