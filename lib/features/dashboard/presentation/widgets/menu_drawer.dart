import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/core/widgets/loading_component.dart';
import 'package:texi_driver/features/auth/services/auth_services.dart';
import 'package:texi_driver/features/profile/presentation/providers/profile_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/router/app_router.dart';

class MenuDrawer extends ConsumerWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final profileDriver = ref.watch(driverProfileNotifierProvider);

    return Drawer(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.primaryColor, width: 2),
                    ),
                    child: profileDriver.when(
                      data: (profile) => profile.pictureProfile != null
                          ? Image.network(
                              profile.pictureProfile!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.person, color: theme.primaryColor),
                            )
                          : Icon(
                              Icons.person,
                              color: theme.primaryColor,
                              size: 32,
                            ),
                      loading: () => loadingComponent(),
                      error: (_, _) => Icon(
                        Icons.person,
                        color: theme.primaryColor,
                        size: 32,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileDriver.when(
                            data: (profile) =>
                                '${profile.firstName} ${profile.lastName}',
                            loading: () => '...',
                            error: (_, _) => 'Error',
                          ),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        /* Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: theme.primaryColor,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              '4.9',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '· 1,240 viajes',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ), */
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.grey[850], thickness: 1, height: 1),

            // Menu Items
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  MenuDrawerItem(
                    icon: Icons.person_outline,
                    label: 'Perfil',
                    route: AppRouter.driverProfileLocation,
                    isSelected: true,
                  ),

                  /*                   const MenuDrawerItem(
                    icon: Icons.history,
                    label: 'Historial',
                    route: '/history',
                  ),
                  const MenuDrawerItem(
                    icon: Icons.payments_outlined,
                    label: 'Ganancias',
                    route: '/earnings',
                  ),
                  const MenuDrawerItem(
                    icon: Icons.support_agent,
                    label: 'Soporte',
                    route: '/support',
                  ), */
                  const SizedBox(height: 32),

                  // Invite Friends Card
                  /* Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: theme.primaryColor.withValues(alpha: 0.2),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          theme.primaryColor.withValues(alpha: 0.1),
                          Colors.transparent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'INVITA AMIGOS',
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          r'Gana $50 por cada conductor referido.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ), */
                ],
              ),
            ),

            Divider(color: Colors.grey[850], thickness: 1, height: 1),

            // Footer
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      try {
                        await AuthServices.logout(ref);
                        if (!context.mounted) return;
                        context.go(AppRouter.authLocation);
                      } catch (e) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(customSnackBar(e.toString(), context));
                      }
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withValues(alpha: 0.3),
                        ),
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            logout.i18n,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  InkWell(
                    onTap: () {
                      exit(0);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(
                            context,
                          ).colorScheme.error.withValues(alpha: 0.3),
                        ),
                        color: Theme.of(
                          context,
                        ).colorScheme.error.withValues(alpha: 0.1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          SizedBox(width: 8),
                          Text(
                            close.i18n,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'TaxiApp v1.0.0 (Build ***)',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Políticas de Privacidad · Términos',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuDrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool isSelected;

  const MenuDrawerItem({
    super.key,
    required this.icon,
    required this.label,
    required this.route,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          context.push('${AppRouter.dashboardLocation}$route');
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? theme.primaryColor.withValues(alpha: 0.08)
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Icon(icon, color: theme.primaryColor, size: 24),
              SizedBox(width: 16.5.sp),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.25.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
