import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/dio_provider.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/utils/image_picker_service.dart';
import 'package:texi/features/register_vehicle/data/model/vehicle_res_model.dart';
import 'package:texi/features/register_vehicle/data/repo_impl/register_vehicle_repo_imp.dart';
import 'package:texi/features/register_vehicle/domain/repo/register_vehicle_repo.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi/features/register_vehicle/domain/entities/vehicle_image_entity.dart';

final vehicleRepoProvider = Provider<RegisterVehicleRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return RegisterVehicleRepoImp(dio);
});

class ListOfYears extends Notifier<List<int>> {
  @override
  List<int> build() {
    return List.generate(50, (index) => index + (DateTime.now().year - 50));
  }
}

final listOfYearsProvider = NotifierProvider<ListOfYears, List<int>>(
  ListOfYears.new,
);

class YearSelectedNotifier extends Notifier<int> {
  @override
  int build() {
    final years = ref.watch(listOfYearsProvider);
    return years.last;
  }

  void setYear(int year) {
    state = year;
  }
}

final yearSelectedProvider = NotifierProvider<YearSelectedNotifier, int>(
  YearSelectedNotifier.new,
);

class VehicleColorNotifier extends Notifier<VehicleColor> {
  @override
  VehicleColor build() {
    return VehicleColor.white;
  }

  void setColor(VehicleColor color) {
    state = color;
  }
}

final vehicleColorProvider =
    NotifierProvider<VehicleColorNotifier, VehicleColor>(
      VehicleColorNotifier.new,
    );

class VehicleTypeNotifier extends Notifier<VehicleType> {
  @override
  VehicleType build() {
    return VehicleType.sedan;
  }

  void setType(VehicleType type) {
    state = type;
  }
}

final vehicleTypeProvider = NotifierProvider<VehicleTypeNotifier, VehicleType>(
  VehicleTypeNotifier.new,
);

class VehiclePhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehiclePhotoProvider =
    NotifierProvider<VehiclePhotoNotifier, AsyncValue<File?>>(
      VehiclePhotoNotifier.new,
    );

class RegisterVehicleState {
  final bool isLoading;
  final String? error;
  final String? response;

  RegisterVehicleState({this.isLoading = false, this.error, this.response});

  RegisterVehicleState copyWith({
    bool? isLoading,
    String? error,
    String? response,
  }) {
    return RegisterVehicleState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      response: response ?? this.response,
    );
  }
}

class RegisterVehicleNotifier extends Notifier<RegisterVehicleState> {
  @override
  RegisterVehicleState build() {
    return RegisterVehicleState();
  }

  Future<VehicleResModel?> registerVehicle(VehicleEntity vehicle) async {
    state = state.copyWith(isLoading: true, error: null);
    final storage = GetIt.instance<AuthSecureStorageService>();
    try {
      final token = await storage.getString(StorageKeys.driverToken);
      if (token == null) {
        state = state.copyWith(isLoading: false, error: tokenNotFound.i18n);
        return null;
      }

      final repo = ref.read(vehicleRepoProvider);
      final response = await repo.registerVehicle(vehicle, token);

      if (response.success) {
        state = state.copyWith(isLoading: false, response: response.data?.uuid);
        return response.data;
      } else {
        state = state.copyWith(isLoading: false, error: response.message);
        return null;
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return null;
    }
  }
}

final registerVehicleProvider =
    NotifierProvider<RegisterVehicleNotifier, RegisterVehicleState>(
      RegisterVehicleNotifier.new,
    );

class VehicleInsurancePhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehicleInsurancePhotoProvider =
    NotifierProvider<VehicleInsurancePhotoNotifier, AsyncValue<File?>>(
      VehicleInsurancePhotoNotifier.new,
    );

class VehicleFrontPhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehicleFrontPhotoProvider =
    NotifierProvider<VehicleFrontPhotoNotifier, AsyncValue<File?>>(
      VehicleFrontPhotoNotifier.new,
    );

class VehicleLeftSidePhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehicleLeftSidePhotoProvider =
    NotifierProvider<VehicleLeftSidePhotoNotifier, AsyncValue<File?>>(
      VehicleLeftSidePhotoNotifier.new,
    );

class VehicleRightSidePhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehicleRightSidePhotoProvider =
    NotifierProvider<VehicleRightSidePhotoNotifier, AsyncValue<File?>>(
      VehicleRightSidePhotoNotifier.new,
    );

class VehicleBackSidePhotoNotifier extends Notifier<AsyncValue<File?>> {
  @override
  AsyncValue<File?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> pickImage(ImageSource source) async {
    final ImagePickerService imagePickerService = ImagePickerService();
    final image = await imagePickerService.pickImage(source);
    if (image != null) {
      state = AsyncValue.data(image);
    }
  }
}

final vehicleBackSidePhotoProvider =
    NotifierProvider<VehicleBackSidePhotoNotifier, AsyncValue<File?>>(
      VehicleBackSidePhotoNotifier.new,
    );

class VehicleImagesSavingNotifier
    extends Notifier<AsyncValue<DataApiResponse?>> {
  @override
  AsyncValue<DataApiResponse?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> saveVehicleImages(List<VehicleImageEntity> vehicleImages) async {
    state = const AsyncValue.loading();
    final repo = ref.read(vehicleRepoProvider);
    final response = await repo.registerVehicleImages(vehicleImages);
    if (response.success) {
      state = AsyncValue.data(response);
    } else {
      state = AsyncValue.error(response.message, StackTrace.current);
    }
  }
}

final vehicleImagesSavingProvider =
    NotifierProvider<VehicleImagesSavingNotifier, AsyncValue<DataApiResponse?>>(
      VehicleImagesSavingNotifier.new,
    );
