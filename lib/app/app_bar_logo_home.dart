
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/main_theme.dart';
import 'app_responsive.dart';

class AppBarLogoHome extends HookWidget implements PreferredSizeWidget {
  final bool showMenu;

  AppBarLogoHome(
    BuildContext context, {
    super.key,
    this.showMenu = true, // por defecto se muestra el menú
  })  : preferredSize = Size.fromHeight(
          AppResponsive.isSmallScreen(context) ? kToolbarHeight : 120,
        );

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: lightColorScheme.surface,
      iconTheme: IconThemeData(color: lightColorScheme.primary),
      title: Text(
        'TEXI',
        style: TextStyle(color: lightColorScheme.primary),
      ),
      centerTitle: true,  
      actions: showMenu
          ? [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: lightColorScheme.primary),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
              ),
            ]
          : null,
      toolbarHeight: preferredSize.height,
    );
  }
}