import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/bloc/login_bloc.dart';
import '../login/service/auth_service.dart';
import 'app_widget.dart';

Future<void> initApp() async {
  
  final blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(authService: AuthService()),
      ),
    ],
    child: const App(),
  );
  runApp(
    blocProvider,
  );
}