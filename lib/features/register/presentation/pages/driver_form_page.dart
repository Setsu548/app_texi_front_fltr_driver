import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_widget.dart';

class DriverFormPage extends ConsumerStatefulWidget {
  const DriverFormPage({super.key});

  @override
  ConsumerState<DriverFormPage> createState() => _DriverFormPageState();
}

class _DriverFormPageState extends ConsumerState<DriverFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormHeaderWidget(),
              SizedBox(height: 2.h),
              Expanded(child: SingleChildScrollView(child: DriverFormWidget())),
            ],
          ),
        ),
      ),
    );
  }
}
