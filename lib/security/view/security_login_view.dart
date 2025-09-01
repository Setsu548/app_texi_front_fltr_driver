import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        
        const SizedBox(height: 20),
        ElevatedButton(onPressed: (){
          appRouter.push('/demo');
        }, child: Text('Demo'))
      ],),
    );
  }
}