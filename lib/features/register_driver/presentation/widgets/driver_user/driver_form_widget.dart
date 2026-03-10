import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/utils/dates_utilities.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/label_textfield_widget.dart';
import 'package:texi/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_form_provider.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_countries_dropdown_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_department_dropdown.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_gender_dropdown.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_locality_dropdown.dart';

class DriverFormWidget extends ConsumerStatefulWidget {
  const DriverFormWidget({super.key});

  @override
  ConsumerState<DriverFormWidget> createState() => _DriverFormWidgetState();
}

class _DriverFormWidgetState extends ConsumerState<DriverFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _birthDateController = TextEditingController();
  Widget checkPassword = SizedBox.shrink();
  Widget checkConfirmPassword = SizedBox.shrink();

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final birthDate = ref.watch(birthDateProvider);
    final gender = ref.watch(genderProvider);
    final countryValue = ref.watch(localCountryProvider);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          LabelTextfieldWidget(
            controller: _nameController,
            hintText: 'Bruce',
            label: '${names.i18n} *',
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              return null;
            },
          ),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _lastNameController,
            hintText: 'Wayne',
            label: '${lastName.i18n} *',
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              return null;
            },
          ),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _emailController,
            hintText: 'email@email.com',
            keyboardType: TextInputType.emailAddress,
            label: '${email.i18n} *',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              if (!EmailValidator.validate(value)) {
                return invalidEmail.i18n;
              }
              return null;
            },
          ),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _birthDateController,
            hintText: DatesUtilities.formatDate(birthDate),
            label: '${dateOfBirth.i18n} *',
            readOnly: true,
            onTap: () => _selectDate(context, birthDate),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.calendar_today,
                size: 17.5.sp,
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              onPressed: () => _selectDate(context, birthDate),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              if (!DatesUtilities.isAdult(birthDate)) {
                return mustBeAdult.i18n;
              }
              return null;
            },
          ),
          SizedBox(height: 1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DriverCountriesDropdownWidget(),
              SizedBox(
                width: 60.w,
                child: LabelTextfieldWidget(
                  controller: _phoneController,
                  hintText: '77777777',
                  keyboardType: TextInputType.phone,
                  label: '${phone.i18n} *',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return requiredField.i18n;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 1.5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [DriverDepartmentDropdown(), DriverLocalityDropdown()],
          ),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _addressController,
            hintText: 'Calle 123 #45-67',
            label: '${address.i18n} *',
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              return null;
            },
          ),
          SizedBox(height: 1.5.h),
          DriverGenderDropdown(),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _passwordController,
            hintText: '********',
            label: '${password.i18n} *',
            obscureText: true,
            suffixIcon: checkPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              if (value.length < 8) {
                return passwordMustBeAtLeast8Characters.i18n;
              }
              return null;
            },
            onChanged: (value) {
              if (value.length < 8) {
                setState(() {
                  checkPassword = SizedBox.shrink();
                });
              } else {
                setState(() {
                  checkPassword = Icon(
                    Icons.check_circle,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.5),
                  );
                });
              }
            },
          ),
          SizedBox(height: 1.5.h),
          LabelTextfieldWidget(
            controller: _confirmPasswordController,
            hintText: '********',
            label: '${confirmPassword.i18n} *',
            obscureText: true,
            suffixIcon: checkConfirmPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return requiredField.i18n;
              }
              if (value != _passwordController.text) {
                return passwordMustMatch.i18n;
              }
              return null;
            },
            onChanged: (value) {
              if (value == _passwordController.text) {
                setState(() {
                  checkConfirmPassword = Icon(
                    Icons.check_circle,
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.5),
                  );
                });
              } else {
                setState(() {
                  checkConfirmPassword = SizedBox.shrink();
                });
              }
            },
          ),
          SizedBox(height: 1.5.h),
          ElevatedButtonWidget(
            iconImageAfter: Icon(Icons.chevron_right),
            label: continueButton.i18n,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                final driver = DriverEntity(
                  firstName: _nameController.text.trim(),
                  lastName: _lastNameController.text.trim(),
                  email: _emailController.text.trim().toLowerCase(),
                  phoneNumber:
                      '${countryValue.dialCode}${_phoneController.text.trim()}',
                  address: _addressController.text.trim(),
                  password: _passwordController.text.trim(),
                  gender: gender.genderToSave.toLowerCase(),
                  birthDate: birthDate,
                  profession: null,
                  localityId: ref.watch(localitySelectedProvider).id,
                );
                context.push(
                  '${AppRouter.registerHomeLocation}/${AppRouter.confirmationDriverDataLocation}',
                  extra: driver,
                );
              } else {
                _showMessage(formErrorFieldMessage.i18n);
              }
            },
          ),
          SizedBox(height: 1.5.h),
          AnotherElevatedButtonWidget(
            label: cancel.i18n,
            onPressed: () => context.pop(),
          ),
          SizedBox(height: 1.5.h),
        ],
      ),
    );
  }

  void _selectDate(BuildContext context, DateTime birthDate) {
    showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        ref.read(birthDateProvider.notifier).setBirthDate(pickedDate);
        _birthDateController.text = DatesUtilities.formatDate(pickedDate);
      }
    });
  }

  void _showMessage(String message) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(customSnackBar(message, context));
}
