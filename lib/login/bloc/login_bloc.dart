import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../app/api_dio.dart';
part 'login_bloc.freezed.dart';


// 📦 Estados
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    String? token,
  }) = _LoginState;
}

// 📦 Eventos
@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initial() = _InitialEvent;
  const factory LoginEvent.loginInit({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required String userName,required String password}) = _LoginInitEvent;
}

// 🧠 Bloc principal
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.apiDio})
      : 
      super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await event.map(
          initial: (event) async => _initial(event, emit),
          loginInit: (event) async => _loginInit(event, emit),
        );
      },
    );
  }
  
  final ApiDio apiDio;

  Future<void> _initial(_InitialEvent event, Emitter<LoginState> emit) async {
    
  }

  Future<void> _loginInit(_LoginInitEvent event, Emitter<LoginState> emit) async {
    try {
      final login = await apiDio.dio.post('/auth/login');
      event.befor!('true');
    } catch (e) {
      
    }
  }
}
