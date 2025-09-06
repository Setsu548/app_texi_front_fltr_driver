import 'package:flutter/material.dart';

class PrimaryVariantButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? colorText;
  final VoidCallback onPressed;

  const PrimaryVariantButton({
    super.key,
    this.backgroundColor,
    this.colorText,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), 
          ),
        ),
        child: Text(text, style: TextStyle(color: colorText),)
      ),
    );
  }
}
