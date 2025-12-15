import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../firebase_options.dart';
import '../login/bloc/login_bloc.dart';
import '../login/service/auth_service.dart';
import 'app_widget.dart';
import 'secure_storage.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  await SecureTokenStorage.clearToken();
  String? token = await SecureTokenStorage.getToken();
  if (token != null && token != '') {
    appRouter.go('/dashboard/driver_dashboard');
  }

  final blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginBloc(authService: AuthService())),
    ],
    child: const App(),
  );
  runApp(blocProvider);
}
