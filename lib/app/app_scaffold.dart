import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppScaffold extends HookWidget {
  const AppScaffold({
    Key? key,
    required this.appBar,
    this.bottomBar,
    this.drawer,
    required this.body,
    required this.loadingOverlay,
    this.floatingActionButton,
    this.withPadding = true,
    this.onBackButtonPressed,
    this.disableBackButton = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget? bottomBar;
  final Widget? drawer;
  final Widget body;
  final Widget? floatingActionButton;
  final Future<bool> Function()? onBackButtonPressed;

  @Deprecated('This options is no longer used')
  final bool loadingOverlay;
  final bool withPadding;
  final bool disableBackButton;

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // Habilita modo inmersivo
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent, // Barra de navegación transparente
      systemNavigationBarIconBrightness: Brightness.light, // Iconos visibles
      statusBarColor: Colors.transparent, // Barra de estado transparente
      statusBarIconBrightness: Brightness.light, // Iconos visibles
    ));
    return WillPopScope(
      onWillPop: () async {
        if (onBackButtonPressed != null) return await onBackButtonPressed!();
        return !disableBackButton;
      },
      child: Scaffold(
        appBar: appBar,
        bottomNavigationBar: bottomBar,
        endDrawer: drawer,
        body: Align(
            alignment: Alignment.center,
            child: withPadding
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: body,
                  )
                : body,
          ),
        
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),);
  }
}
