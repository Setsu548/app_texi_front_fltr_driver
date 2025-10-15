import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/bloc/login_bloc.dart';
import 'api_dio.dart';
import 'app_widget.dart';

Future<void> initApp() async {
  final blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => LoginBloc(apiDio: ApiDio()),
      ),
    ],
    child: const App(),
  );
  runApp(
    blocProvider,
  );
}