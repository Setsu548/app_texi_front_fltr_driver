import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'app_responsive.dart';

class AppBarLogo extends HookWidget implements PreferredSizeWidget {
  AppBarLogo(BuildContext context, {Key? key})
      : preferredSize = Size.fromHeight(AppResponsive.isSmallScreen(context) ? kToolbarHeight : 120),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
        return AppBar(
          title: SizedBox(
            height: preferredSize.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('TEXI')
            ),
          ),
          centerTitle: preferredSize.height == kToolbarHeight,
          automaticallyImplyLeading: true,
          toolbarHeight: preferredSize.height,
        );
  }
}