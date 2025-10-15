import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/label_field_widget.dart';
import '../../app/widgets/primary_variant_button.dart';
import '../../theme/main_theme.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30),
      child: Column(
        children: [
        LabelFieldWidget(
          label: context.intl.bodyTextPhone,
          field: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            initialValue: PhoneNumber(isoCode: 'BO'),
            textFieldController: TextEditingController(),
            inputDecoration: InputDecoration(
              hintText: '',
            ),
          ),
        ),
        const SizedBox(height: 20),
        LabelFieldWidget(
          label: context.intl.labelPassword,
          field: TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (_) => {},
            maxLength: 40,
            buildCounter: (
            BuildContext context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
            }) =>
              null,
              validator: (newValue) {
              if (newValue == null || newValue == '') return context.intl.commonRequiredFieldError;
                return null;
              },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BodyText('¿Olvidaste tu contraseña?', color: lightColorScheme.surfaceVariant,textAlign: TextAlign.end,),
          ],
        ),
        const SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonSignIn,
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