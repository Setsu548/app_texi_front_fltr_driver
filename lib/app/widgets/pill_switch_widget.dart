import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class PillSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Duration duration;

  const PillSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.duration = const Duration(milliseconds: 180),
  });

  @override
  Widget build(BuildContext context) {
    final trackOn = lightColorScheme.surfaceDim;
    final trackOff = lightColorScheme.secondaryContainer; 
    final knob = lightColorScheme.onSurface;

    final radius = 52 / 2;

    return Semantics(
      button: true,
      toggled: value,
      child: GestureDetector(
        onTap: () => onChanged(!value),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: duration,
          curve: Curves.easeInOut,
          width: 52,
          height: 28,
          decoration: BoxDecoration(
            color: value ? trackOn : trackOff,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: AnimatedAlign(
            duration: duration,
            curve: Curves.easeInOut,
            alignment: value ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                width: 28 - 6,
                height: 28 - 6,
                decoration: BoxDecoration(
                  color: knob,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
