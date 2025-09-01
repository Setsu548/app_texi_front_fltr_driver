import 'package:flutter/material.dart';

class AppResponsive extends StatelessWidget {
  const AppResponsive({
    Key? key,
    required this.smallScreen,
    this.mediumScreen,
    this.largeScreen,
    this.fallbackToSmall = true,
  }) : super(key: key);

  final Widget smallScreen;
  final Widget? mediumScreen;
  final Widget? largeScreen;
  final bool fallbackToSmall;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return largeScreen ?? (fallbackToSmall ? smallScreen : Container());
      } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
        return mediumScreen ?? (fallbackToSmall ? smallScreen : Container());
      } else {
        return smallScreen;
      }
    });
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 && MediaQuery.of(context).size.width < 1200;
  }
}
