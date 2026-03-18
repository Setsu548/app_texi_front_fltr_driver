import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/providers/dio_provider.dart';
import 'package:texi_driver/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:texi_driver/features/auth/domain/repo/auth_repo.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/auth/data/models/login_data_model.dart';
import 'package:texi_driver/features/auth/domain/entities/auth_entity.dart';
import 'package:texi_driver/features/auth/data/models/connection_ack_res_model.dart';
import 'package:texi_driver/features/auth/presentation/providers/states/profile_state.dart';

//--Provider para ocultar la contraseña--//
final hidePasswordProvider = NotifierProvider<HidePasswordProvider, bool>(
  HidePasswordProvider.new,
);

class HidePasswordProvider extends Notifier<bool> {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}
//--//

//--Provider del repositorio de auth--//
final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepoImpl(ref.watch(dioProvider));
});
//--//

//--Provider para la autenticación--//
final loginNotifierProvider = NotifierProvider<LoginNotifier, bool>(
  LoginNotifier.new,
);
//--//

//--Clase Notifier para la autenticación--//
class LoginNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<DataApiResponse<LoginDataModel>> login(AuthEntity authEntity) async {
    state = true;
    final repo = ref.read(authRepoProvider);
    final response = await repo.login(authEntity);
    state = false;
    return response;
  }
}

//--//

//--Clase Notifier para verificar si tiene vehículo--//
class HasVehicleNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<bool?> hasVehicle() async {
    state = true;
    final repo = ref.read(authRepoProvider);
    final response = await repo.hasVehicle();
    state = false;
    return response;
  }
}

final hasVehicleNotifierProvider = NotifierProvider<HasVehicleNotifier, bool>(
  HasVehicleNotifier.new,
);

//--//

//--Clase Notifier para el perfil del conductor--//
class ProfileNotifier extends Notifier<ProfileState?> {
  @override
  ProfileState? build() {
    return null;
  }

  void loadFromConnectionAck(ConnectionAckResModel connectionAck) {
    state = ProfileState.fromProfile(connectionAck.profile);
  }

  void clear() {
    state = null;
  }
}

final profileNotifierProvider = NotifierProvider<ProfileNotifier, ProfileState?>(
  ProfileNotifier.new,
);
//--//
