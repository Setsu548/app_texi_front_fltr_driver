import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../app/widgets/loading_dialog.dart';
import '../../app/widgets/side_menu_item_widget.dart';
import '../../login/bloc/login_bloc.dart';

class SideMenuView extends HookWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).routerDelegate.currentConfiguration.matches.last.matchedLocation;


    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideMenuItem(
            icon: Icons.home,
            text: 'Inicio',
            isSelected: currentRoute.startsWith('/dashboard/driver_dashboard'),
            onTap: () => appRouter.go('/dashboard/driver_dashboard'),
          ),
          SideMenuItem(
            icon: Icons.person,
            text: context.intl.sideMenuItemProfile,
            isSelected: currentRoute.startsWith('/navigation/profile'),
            onTap: () => appRouter.go('/navigation/profile'),
          ),
          SideMenuItem(
            icon: Icons.history,
            text: context.intl.sideMenuItemHistory,
            isSelected: currentRoute.startsWith('/navigation/travel_history'),
            onTap: () => appRouter.go('/navigation/travel_history'),
          ),
          SideMenuItem(
            icon: Icons.emoji_transportation_sharp,
            text: 'Vehículo',
            isSelected: currentRoute.startsWith('/security/vehicle_selection'),
            onTap: () => appRouter.go('/security/vehicle_selection'),
          ),
          SideMenuItem(
            icon: Icons.attach_money,
            text: context.intl.sideMenuItemEarnings,
            isSelected: currentRoute.startsWith('/navigation/earnings'),
            onTap: () => appRouter.go('/navigation/earnings'),
          ),
          SideMenuItem(
            icon: Icons.headset_mic,
            text: context.intl.sideMenuItemOperatorTexi,
            isSelected: currentRoute.startsWith('/navigation/bonuses'),
            onTap: () => appRouter.go('/navigation/bonuses'),
          ),
          SideMenuItem(
            icon: Icons.logout,
            text: context.intl.sideMenuItemLogout,
            color: lightColorScheme.error,
            onTap: () {
              context.read<LoginBloc>().add(LoginEvent.logout(
                befor: (_) => showLoadingDialog(context),
                success: (_) {
                  hideLoadingDialog(context);
                  appRouter.go('/security/login');
                },
                error: (error) {
                  hideLoadingDialog(context);
                  showErrorDialog(
                    context,
                    Icons.error_outline,
                    error.message,
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
