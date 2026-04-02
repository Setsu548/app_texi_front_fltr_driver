import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/providers/device_info_provider.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/core/widgets/label_textfield_widget.dart';
import 'package:texi_driver/core/widgets/loading_screen.dart';
import 'package:texi_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:texi_driver/features/auth/presentation/providers/auth_providers.dart';
import 'package:texi_driver/features/auth/services/auth_services.dart';
import 'package:texi_driver/features/dashboard/presentation/provider/dashboard_providers.dart';
import 'package:texi_driver/features/profile/presentation/providers/profile_provider.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_form_provider.dart';

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
    final isLoggingIn = ref.watch(loginNotifierProvider);

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/texiFondo.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.25),
                  BlendMode.overlay,
                ),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Image.asset(
                    'assets/images/texi.png',
                    height: 180,
                    width: 450,
                    fit: BoxFit.fitWidth,
                  ),
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
                  //TODO: Delete the register token?.
                  TextButton(
                    onPressed: () async {
                      //await storage.deleteString(StorageKeys.driverRegister);
                      context.mounted
                          ? context.go(AppRouter.registerHomeLocation)
                          : null;
                    },
                    child: Text(
                      registerOpcion.i18n,
                      style: StylesForTexts(context: context)
                          .headerStyleSmall()
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          LabelTextfieldWidget(
                            label: phone.i18n,
                            controller: _phoneController,
                            hintText: '${countryValue.dialCode} 77777777',
                            keyboardType: TextInputType.phone,
                            onTap: () => setState(() {
                              _phoneController.text = countryValue.dialCode;
                            }),
                            isBold: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return phoneRequired.i18n;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 2.5.h),
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
                                ref
                                    .read(hidePasswordProvider.notifier)
                                    .toggle();
                              },
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return passwordRequired.i18n;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  /* TextButton(
                    onPressed: () {},
                    child: Text(
                      forgetPassword.i18n,
                      textAlign: TextAlign.right,
                    ),
                  ), */
                  SizedBox(height: 10.h),
                  ElevatedButtonWidget(
                    label: login.i18n,
                    onPressed: () async {
                      final deviceInfo = await ref.watch(deviceProvider.future);
                      final phone = _phoneController.text;
                      final password = _passwordController.text;
                      final authEntity = AuthEntity.fromRequest(
                        deviceInfo,
                        phone,
                        password,
                      );
                      final response = await ref
                          .read(loginNotifierProvider.notifier)
                          .login(authEntity);
                      if (response.success) {
                        final cookie = response.data;
                        AuthServices.saveDriverTokens(cookie!);
                        //AuthServices.initSocket(ref);
                        // Fetch profile data for the first time
                        ref.read(driverProfileNotifierProvider.future);
                        _showMessage(welcomeDriver.i18n);
                        final flag = await ref
                            .read(hasVehicleNotifierProvider.notifier)
                            .hasVehicle();
                        if (!context.mounted) return;
                        if (flag == false && flag != null) {
                          _navigateToVehiclePage();
                        } else {
                          if (flag == null) {
                            _showMessage(userNotFound.i18n);
                          } else {
                            context.go(AppRouter.vehicleListLocation);
                            await ref
                                .read(vehicleListProvider.notifier)
                                .getVehicleList();
                          }
                        }
                      } else {
                        _showMessage(response.error!.details);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          if (isLoggingIn) const LoadingScreen(),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar(message, context));
  }

  void _navigateToVehiclePage() {
    if (!mounted) return;
    context.go(AppRouter.vehicleRegisterHome);
  }
}
