import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//Widget to show the gif car image
class CarImageWidget extends StatelessWidget {
  const CarImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: Image.asset('assets/images/bienvenido.gif'),
    );
  }
}
