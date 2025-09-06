import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_router.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Iniciar Sesion',
          onPressed: (){
            appRouter.go('/dashboard/driver_dashboard');
          }
        ),
        SizedBox(height: 10),
        ElevatedButton(onPressed: (){
          appRouter.push('/demo');
        }, child: Text('Demo')),
      ],),
    );
  }
}