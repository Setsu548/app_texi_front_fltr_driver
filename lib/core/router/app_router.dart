import 'package:go_router/go_router.dart';
import 'package:texi/features/auth/presentation/pages/auth_page.dart';
import 'package:texi/features/register/presentation/pages/register_home_page.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => AuthPage()),
      GoRoute(
        path: '/registerHome',
        builder: (context, state) => RegisterHomePage(),
      ),
    ],
  );
}
