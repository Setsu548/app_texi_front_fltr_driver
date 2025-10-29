import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../app/secure_storage.dart';
import '../models/document_info.dart';
import '../models/personal_info_model.dart';
import '../service/auth_service.dart';
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
  const factory LoginEvent.registerPersonal({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required PersonalInfoModel personalInfo}) = _RegisterPersonalEvent;
  const factory LoginEvent.documentInfo({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required DocumentInfo documentInfo}) = _DocumentInfoEvent;
}

// 🧠 Bloc principal
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthService authService;

  LoginBloc({required this.authService}) : super(const LoginState()) {
    on<LoginEvent>(
      (event, emit) async {
        await event.map(
          initial: (event) async => _initial(event, emit),
          loginInit: (event) async => _loginInit(event, emit),
          registerPersonal: (event) async => _registerPersonal(event, emit),
          documentInfo: (event) async => _documentInfo(event, emit),
        );
      },
    );
  }
  
  

  Future<void> _initial(_InitialEvent event, Emitter<LoginState> emit) async {
    
  }

  Future<void> _loginInit(_LoginInitEvent event, Emitter<LoginState> emit) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        final res = await authService.login(event.userName,event.password,androidInfo.brand,androidInfo.model,'Android ${androidInfo.version.release}','');

        if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data?.token}');
          SecureTokenStorage.saveToken(res.data!.token);
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        final res = await authService.login(event.userName,event.password,iosInfo.utsname.machine,iosInfo.model,'iOS ${iosInfo.systemVersion}','');
        if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data?.token}');
        } else {
          print('⚠️ Error: ${res.message}');
        }
      }
    } catch (e) {
      print('❌ Error inesperado: $e');
    }
  }
  Future<void> _registerPersonal(_RegisterPersonalEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.personalInfo(event.personalInfo);
      if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data}');
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }
  Future<void> _documentInfo(_DocumentInfoEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.documentInfo(event.documentInfo);
      if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data}');
          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }
}
