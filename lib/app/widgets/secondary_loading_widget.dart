import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:flutter/material.dart';

class SecondaryLoading extends StatelessWidget {
  const SecondaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 24),
              BodyText('Procesando...'),
            ],
          )
        ],
      ),
    );
  }
}

