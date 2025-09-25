import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../app/widgets/side_menu_item_widget.dart';

class SideMenuView extends HookWidget {
  const SideMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        SideMenuItem(
          icon: Icons.person,
          text: context.intl.sideMenuItemProfile,
          onTap: () {
            appRouter.push('/navigation/profile');
          },
        ),
        SideMenuItem(
          icon: Icons.history,
          text: context.intl.sideMenuItemHistory,
          onTap: () {
            appRouter.push('/navigation/travel_history');
          },
        ),
        SideMenuItem(
          icon: Icons.attach_money,
          text: context.intl.sideMenuItemEarnings,
          onTap: () {
            appRouter.push('/navigation/earnings');
          },
        ),
        SideMenuItem(
          icon: Icons.headset_mic,
          text: context.intl.sideMenuItemOperatorTexi,
          onTap: () {
            appRouter.push('/navigation/bonuses');
          },
        ),
        SideMenuItem(
          icon: Icons.logout,
          text: context.intl.sideMenuItemLogout,
          color: lightColorScheme.error,
          onTap: () {}
        ),
      ],
    );
  }
}