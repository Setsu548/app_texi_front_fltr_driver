import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../app/widgets/date_picker_field_widget.dart';
import '../../app/widgets/label_field_widget.dart';
import '../../app/widgets/loading_dialog.dart';
import '../bloc/login_bloc.dart';
import '../models/personal_info_model.dart';
import '../utils/bottom_sheet.dart';
import '../utils/format_date.dart';
import '../utils/format_long_date_es.dart';

class PersonalInfoFormView extends HookWidget {
  const PersonalInfoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final form = useMemoized(GlobalKey<FormState>.new);
    final firstNameController = useTextEditingController(text: '');
    final lastNameNameController = useTextEditingController(text: '');
    final phoneController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');
    final addressController = useTextEditingController(text: '');
    final department = useState<String?>(null);
    final province = useState<String?>(null);
    final emailController = useTextEditingController(text: '');
    final professionController = useTextEditingController(text: '');
    final selectedDate = useState<DateTime>(DateTime.now());
    final dialCode = useState<String?>(null);

    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(context.intl.titleTextPersonalInfo, color: lightColorScheme.primary),
          LabelText(context.intl.labelTextEnterPersonalData),
          SizedBox(height: 20),
          CardOnSurface(
            padding: EdgeInsetsGeometry.all(20),
            children: [
              LabeledTextField(
                controller: firstNameController,
                label: context.intl.labeledTextFieldFirstName,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldFirstNameHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledTextField(
                controller: lastNameNameController,
                label: context.intl.labeledTextFieldLastName,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldLastNameHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabelFieldWidget(
                label: context.intl.bodyTextPhone,
                field: InternationalPhoneNumberInput(
                  textFieldController: phoneController,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    dialCode.value = number.dialCode ?? '';
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                    showFlags: true,
                    useEmoji: true,
                  ),
                  initialValue: PhoneNumber(isoCode: 'BO'),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black, // 👈 asegura que el número y el código sean visibles
                  ),
                  selectorTextStyle: const TextStyle(
                    color: Colors.black, // 👈 hace visible el texto del código +591
                    fontSize: 16,
                  ),
                  cursorColor: Colors.black,
                  inputDecoration: InputDecoration(
                    hintText: 'Ej. 71234567',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  validator: (newValue) {
                    if (newValue == null || newValue.isEmpty) {
                      return context.intl.commonRequiredFieldError;
                    }
                    if (newValue.length != 8) {
                      return 'El número de celular debe tener exactamente 8 dígitos';
                    }
                    return null;
                  },
                ),
              ),
              LabeledTextField(
                controller: passwordController,
                label: context.intl.labelPassword,
                colorLabel: lightColorScheme.surface, 
                isPassword: true,
                hint: '',
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  if (newValue.length <= 7) {
                    return 'La contraseña debe tener más de 8 caracteres';
                  }
                  return null;
                },
              ),
              LabeledTextField(
                controller: professionController,
                label: context.intl.labelProfession,
                colorLabel: lightColorScheme.surface, 
                hint: 'Ingresar una profesión',
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledTextField(
                controller: addressController,
                label: context.intl.labeledTextFieldAddress,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldAddressHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledDropdown(
                label: context.intl.labeledDropdownDepartment, 
                colorLabel: lightColorScheme.surface,
                hint: context.intl.labeledDropdownDepartmentHint, 
                onChanged: (val) => department.value = val,
                items: [
                  DropdownMenuItem(
                    value: "Cochabamba",
                    child: BodyText("Cochabamba", color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: "La Paz",
                    child: BodyText("La Paz", color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: "Santa Cruz",
                    child: BodyText("Santa Cruz", color: lightColorScheme.surface),
                  ),
                ],
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledDropdown(
                label: context.intl.labeledDropdownProvince, 
                colorLabel: lightColorScheme.surface,
                hint: context.intl.labeledDropdownProvinceHint, 
                onChanged: (val) => province.value = val,
                items: [
                  DropdownMenuItem(
                    value: "Cercado",
                    child: BodyText("Cercado", color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: "Capinota",
                    child: BodyText("Capinota", color: lightColorScheme.surface),
                  ),
                  DropdownMenuItem(
                    value: "Punata",
                    child: BodyText("Punata", color: lightColorScheme.surface),
                  ),
                ],
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabeledTextField(
                controller: emailController,
                label: context.intl.labeledTextFieldEmail,
                colorLabel: lightColorScheme.surface, 
                hint: context.intl.labeledTextFieldEmailHint,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return context.intl.commonRequiredFieldError;
                  }
                  return null;
                },
              ),
              LabelText('Fecha de nacimiento', color: lightColorScheme.surface),
              DatePickerField(
                backgroundColor: lightColorScheme.onSecondary,
                borderColor: lightColorScheme.surface,
                arrowColor: lightColorScheme.surface,
                dateText: formatDate(selectedDate.value),
                onTap: () async {
                  final picked = await showBottomSheetDatePicker(
                    context,
                  );
                  if (picked != null) {
                    selectedDate.value = picked; 
                  }
                }
              ),
            ],
          ),
          SizedBox(height: 20),
          PrimaryVariantButton(
            text: context.intl.primaryVariantButtonContinue, 
            onPressed: (){
              if (form.currentState != null && form.currentState!.validate()) {
                final personalInfo = PersonalInfoModel(
                  phoneNumber: '${dialCode.value ?? ''}${phoneController.text}',
                  password: passwordController.text,
                  firstName: firstNameController.text,
                  lastName: lastNameNameController.text,
                  email: emailController.text,
                  address: addressController.text,
                  profession: professionController.text,
                  country: 'Bolivia',
                  city: department.value!,
                  province: province.value!,
                  gender: '',
                  birthDate: formatShortDateEs(selectedDate.value)
                );
                context.read<LoginBloc>().add(LoginEvent.registerPersonal(
                  personalInfo: personalInfo,
                  befor: (res){
                    showLoadingDialog(context);
                  },
                  success: (res){
                    hideLoadingDialog(context);
                    showErrorDialog(
                          context,
                          Icons.check,
                          res.message,
                          title: '',
                          color: lightColorScheme.surfaceDim,
                          onAccept: (){
                            Navigator.pop(context);
                            appRouter.push('/security/identity_verification');
                          }
                        );
                  },
                  error: (err){
                    hideLoadingDialog(context);
                    showErrorDialog(
                        context,
                        Icons.error_outline,
                        err['details'] ?? 'Error desconocido',
                        title: err['message'] ?? 'Error',
                      );
                  }
                ));
              }
            }
          ),
          SizedBox(height: 20),
          SecondaryVariantButton(
            text: context.intl.secondaryVariantButtonCancel, 
            onPressed: (){
              appRouter.pop();
            }
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}