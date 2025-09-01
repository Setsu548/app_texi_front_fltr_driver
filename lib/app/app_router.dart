import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../security/screen/security_login_screen.dart';
import 'screen/app_demo_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final _rootNavigatorKey = GlobalKey<NavigatorState>();

CustomTransitionPage getBuilder(GoRouterState state, {required Widget screen}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: screen,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/security/login',
  // redirect: (context, state) async {
  // },
  routes: [
    GoRoute(
      path: '/demo',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const AppDemoScreen(),
        );
      },
    ),
    GoRoute(
      path: '/security/login',
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return getBuilder(
          state,
          screen: const SecurityLoginScreen(),
        );
      },
    ),
  ]
);

extension GoRouterExtension on GoRouter {
  void popUntil(String location, {Object? extra}) {
    while (routerDelegate.currentConfiguration.matches.last.matchedLocation != location) {
      if (!canPop()) {
        return;
      }
      pop(extra);
    }
  }
}

extension GoRouterHelper on BuildContext {
  void popUntil(String location, {Object? extra}) => GoRouter.of(this).popUntil(location, extra: extra);
}