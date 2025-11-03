import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../app/secure_storage.dart';
import '../models/document_info.dart';
import '../models/personal_info_model.dart';
import '../models/vehicle_images_card.dart';
import '../models/vehicle_model.dart';
import '../service/auth_service.dart';
part 'login_bloc.freezed.dart';


// 📦 Estados
@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    String? token,
    @Default(null) String? nombre,
    @Default(null) String? ci,
    @Default(null) String? telefono,
    @Default(null) String? email,
    @Default(null) String? categoria,
    @Default(null) String? uuid,
    @Default(null) String? cartId,
    @Default(null) VehicleModel? vehicleModel,
    @Default([]) List<VehicleModel> listUsersVehicle,
    @Default(false) bool? loadingListVehicle,
  }) = _LoginState;
}

// 📦 Eventos
@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initial() = _InitialEvent;
  const factory LoginEvent.loginInit({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required String userName,required String password}) = _LoginInitEvent;
  const factory LoginEvent.logout({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error}) = _LogoutEvent;
  const factory LoginEvent.registerPersonal({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required PersonalInfoModel personalInfo}) = _RegisterPersonalEvent;
  const factory LoginEvent.documentInfo({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required DocumentInfo documentInfo}) = _DocumentInfoEvent;
  const factory LoginEvent.vehicleRegister({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required VehicleModel vehicleModel}) = _VehicleRegisterEvent;
  const factory LoginEvent.updateUser({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required String uuid}) = _UpdateUserEvent;
  const factory LoginEvent.vehicleImagesCar({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required VehicleImagesCard vehicleImagesCar}) = _VehicleImagesCarEvent;
  const factory LoginEvent.getVehiclePlate({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,String? plate}) = _GetVehiclePlateEvent;
  const factory LoginEvent.updateVehicle({Function(dynamic)? befor,Function(dynamic)? success,
    Function(dynamic)? error,required String uuid}) = _UpdateVehicleEvent;
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
          logout: (event) async => _logout(event, emit),
          registerPersonal: (event) async => _registerPersonal(event, emit),
          documentInfo: (event) async => _documentInfo(event, emit),
          vehicleRegister: (event) async => _vehicleRegister(event, emit),
          updateUser: (event) async => _updateUser(event, emit),
          vehicleImagesCar: (event) async => _vehicleImagesCar(event, emit),
          getVehiclePlate: (event) async => _getVehiclePlate(event, emit),
          updateVehicle: (event) async => _updateVehicle(event, emit),
        );
      },
    );
  }
  
  

  Future<void> _initial(_InitialEvent event, Emitter<LoginState> emit) async {
    
  }
  Future<void> _logout(_LogoutEvent event, Emitter<LoginState> emit) async {
    try {
      final res = await authService.logout();

        if (res.success) {
          print('✅ ${res.message}');
          SecureTokenStorage.clearToken();

          event.success!(res);
        } else {
          print('⚠️ Error: ${res.message}');
          event.error!(res);
        }
    } catch (e) {
      event.error!(e);
    }
  }
  Future<void> _loginInit(_LoginInitEvent event, Emitter<LoginState> emit) async {
    try {
      final deviceInfoPlugin = DeviceInfoPlugin();
      event.befor!('');
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
          SecureTokenStorage.saveToken(res.data!.token);
          event.success!(res);
          print('🔑 Token: ${res.data?.token}');
        } else {
          event.error!(res);
          print('⚠️ Error: ${res.message}');
        }
      }
    } catch (e) {
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }
  Future<void> _registerPersonal(_RegisterPersonalEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.personalInfo(event.personalInfo);
      if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data!.uuid}');
          emit(
            state.copyWith(
              nombre: event.personalInfo.lastName,
              telefono: event.personalInfo.phoneNumber,
              email: event.personalInfo.email,
              uuid: res.data!.uuid
            ),
          );
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
        if (event.documentInfo.documentType == 6) {
          emit(
            state.copyWith(
              categoria: event.documentInfo.documentNumber,
            ),
          );
        }else{
          emit(
            state.copyWith(
              ci: event.documentInfo.documentNumber,
            ),
          );
        }
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

  Future<void> _vehicleRegister(_VehicleRegisterEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.vehicleRegister(event.vehicleModel);
      if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data}');
          emit(
            state.copyWith(
              vehicleModel: event.vehicleModel,
              cartId: res.data!.carUuid
            ),
          );
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

  Future<void> _updateUser(_UpdateUserEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.updateUser(event.uuid);
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

  Future<void> _vehicleImagesCar(_VehicleImagesCarEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.vehicleImagesCar(event.vehicleImagesCar);
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

  Future<void> _getVehiclePlate(_GetVehiclePlateEvent event, Emitter<LoginState> emit) async {
    try {
      emit(
            state.copyWith(
              loadingListVehicle: true,
            ),
          );
      event.befor!('init');
      final res = await authService.usersVehicle(event.plate ?? '');
      if (res.success) {
          print('✅ ${res.message}');
          print('🔑 Token: ${res.data}');
          emit(
            state.copyWith(
              listUsersVehicle: res.data!,
            ),
          );
          event.success!(res);
          emit(state.copyWith(loadingListVehicle: false));
        } else {
          print('⚠️ Error: ${res.message}');
          emit(state.copyWith(loadingListVehicle: false));
          event.error!(res);
        }
    } catch (e) {
      emit(state.copyWith(loadingListVehicle: false));
      event.error!(e);
      print('❌ Error inesperado: $e');
    }
  }

  Future<void> _updateVehicle(_UpdateVehicleEvent event, Emitter<LoginState> emit) async {
    try {
      event.befor!('init');
      final res = await authService.updateVehicle(event.uuid);
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
