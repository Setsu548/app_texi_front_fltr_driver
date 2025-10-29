import 'package:flutter/material.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart'; // usa tu tema principal

/// Muestra un modal de carga que no puede cerrarse manualmente.
/// Usa [hideLoadingDialog(context)] para cerrarlo desde el código.
void showLoadingDialog(BuildContext context, {String message = "Cargando..."}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.4),
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: lightColorScheme.surface,
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: lightColorScheme.primary,
                  strokeWidth: 4.0,
                ),
                const SizedBox(height: 24),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightColorScheme.onSurface,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
}
