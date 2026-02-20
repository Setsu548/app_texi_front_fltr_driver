import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/label_textfield_widget.dart';
import 'package:texi/features/auth/presentation/providers/auth_providers.dart';
import 'package:texi/features/auth/services/validate_cokie_driver.dart';
import 'package:texi/features/register/presentation/providers/driver_form_provider.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hidePassword = ref.watch(hidePasswordProvider);
    final countryValue = ref.watch(localCountryProvider);

    return Scaffold(
      appBar: null,
      //Fondo de pantalla
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/texiFondo.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withValues(alpha: 0.25),
              BlendMode.overlay,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              //Logo de la aplicación
              Image.asset(
                'assets/images/texi.png',
                height: 180,
                width: 450,
                fit: BoxFit.fitWidth,
              ),
              //Descripción de la aplicación
              Text(
                loginDescription.i18n,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5.sp,
                  letterSpacing: 1.75.sp,
                ),
              ),
              SizedBox(height: 5.h),
              //Botón de registro
              TextButton(
                onPressed: () {
                  context.go(AppRouter.registerHomeLocation);
                },
                child: Text(registerOpcion.i18n),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //Campo de texto para el teléfono
                      LabelTextfieldWidget(
                        label: phone.i18n,
                        controller: _phoneController,
                        hintText: '${countryValue.dialCode} 77777777',
                        onTap: () => setState(() {
                          _phoneController.text = countryValue.dialCode;
                        }),
                        isBold: true,
                      ),
                      SizedBox(height: 2.5.h),
                      //Campo de texto para la contraseña
                      LabelTextfieldWidget(
                        label: password.i18n,
                        controller: _passwordController,
                        hintText: '********',
                        obscureText: hidePassword,
                        isBold: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withValues(alpha: 0.5),
                          ),
                          onPressed: () {
                            ref.read(hidePasswordProvider.notifier).toggle();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Botón de olvide mi contraseña
              TextButton(
                onPressed: () {},
                child: Text(forgetPassword.i18n, textAlign: TextAlign.right),
              ),
              SizedBox(height: 10.h),
              //Botón de iniciar sesión
              ElevatedButtonWidget(
                label: login.i18n,
                onPressed: () async {
                  final cockieDriver = await ValidateCokieDriver()
                      .validateCokieDriver(_phoneController.text);
                  if (cockieDriver == null) {
                    _showMessage(doNotExistRegister.i18n);
                  } else {
                    _showMessage(completeProcessRegistration.i18n);
                    _navigateToIdentityPage();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar(message, context));
  }

  void _navigateToIdentityPage() {
    context.go('/registerHome/identity');
  }
}
