import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../app/app_router.dart';
import '../../app/widgets/body_text_widget.dart';
import '../../app/widgets/label_field_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/primary_variant_button.dart';
import '../../theme/main_theme.dart';

class SecurityLoginView extends HookWidget {
  const SecurityLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final dialCode = useState<String?>(null);

    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30),
      child: Column(
        children: [
        LabelFieldWidget(
          label: context.intl.bodyTextPhone,
          field: InternationalPhoneNumberInput(
            textFieldController: userNameController,
            onInputChanged: (PhoneNumber number) {
              dialCode.value = number.dialCode ?? '';
              print('📞 Número completo: ${dialCode.value}');
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
            ),
            initialValue: PhoneNumber(isoCode: 'BO'),
            inputDecoration: InputDecoration(
              hintText: '',
            ),
          ),
        ),
        const SizedBox(height: 20),
        LabelFieldWidget(
          label: context.intl.labelPassword,
          field: TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.text,
            onSaved: (_) => {},
            maxLength: 40,
            obscureText:true,
            buildCounter: (
            BuildContext context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
            }) =>
              null,
              validator: (newValue) {
                if (newValue == null || newValue.isEmpty) {
                  return context.intl.commonRequiredFieldError;
                }
                if (newValue.length < 8) {
                  return 'La contraseña debe tener al menos 8 caracteres';
                }
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
            context.read<LoginBloc>().add(LoginEvent.loginInit(
                userName: '${dialCode.value ?? ''}${userNameController.text}', 
                password: passwordController.text,
                befor: (res){
                  showLoadingDialog(context);
                },
                success: (res){
                  hideLoadingDialog(context);
                  appRouter.go('/dashboard/driver_dashboard');
                },
                error: (error){
                  hideLoadingDialog(context);
                  showErrorDialog(
                    context,
                    Icons.error_outline,
                    error.message,
                  );
                }
              )
            );
            
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