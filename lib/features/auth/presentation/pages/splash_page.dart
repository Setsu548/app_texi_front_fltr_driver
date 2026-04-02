import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/features/auth/services/auth_services.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _checkToken());
  }

  Future<void> _checkToken() async {
    try {
      final isExpired = await AuthServices.isDriverTokenExpired();
      if (!mounted) return;

      if (!isExpired) {
        context.go(AppRouter.dashboardLocation);
      } else {
        try {
          await AuthServices.refreshToken(ref);
          if (!mounted) return;
          context.go(AppRouter.dashboardLocation);
        } catch (e) {
          if (!mounted) return;
          final message = e.toString().replaceAll('Exception: ', '');
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(message, context));
          context.go(AppRouter.authLocation);
        }
      }
    } catch (e) {
      if (!mounted) return;
      final message = e.toString().replaceAll('Exception: ', '');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(customSnackBar(message, context));
      context.go(AppRouter.authLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).colorScheme.surface.withValues(alpha: 0.5),
      body: Center(
        child: Image.asset(
          'assets/images/loader_image.gif',
          height: 20.w,
          width: 20.w,
        ),
      ),
    );
  }
}
