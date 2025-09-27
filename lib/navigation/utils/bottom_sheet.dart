import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

Future<DateTime?> showBottomSheetDatePicker(
  BuildContext context, {
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) {
  final now = DateTime.now();
  final init = initialDate ?? DateTime(now.year, now.month, now.day);
  final first = firstDate ?? DateTime(now.year - 5);
  final last = lastDate ?? DateTime(now.year + 5);

  return showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: false,
    backgroundColor: lightColorScheme.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) {
      DateTime temp = init;
      return SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40, height: 4,
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: lightColorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              Flexible(
                child: CalendarDatePicker(
                  initialDate: init,
                  firstDate: first,
                  lastDate: last,
                  onDateChanged: (d) => temp = d,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: BodyText(
                        context.intl.btnCancel,
                        color: lightColorScheme.onSurface,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightColorScheme.primary,
                      ),
                      onPressed: () => Navigator.pop(ctx, temp),
                      child: Text(
                        context.intl.btnSelect,
                        style: TextStyle(color: lightColorScheme.onPrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
