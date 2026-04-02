import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/core/providers/dio_provider.dart';
import 'package:texi_driver/core/constants/enums.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/utils/image_picker_service.dart';
import 'package:texi_driver/features/register_vehicle/data/model/vehicle_res_model.dart';
import 'package:texi_driver/features/register_vehicle/data/repo_impl/register_vehicle_repo_imp.dart';
import 'package:texi_driver/features/register_vehicle/domain/repo/register_vehicle_repo.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_entity.dart';
import 'package:texi_driver/features/register_vehicle/domain/entities/vehicle_image_entity.dart';

final vehicleRepoProvider = Provider<RegisterVehicleRepo>((ref) {
  final dio = ref.watch(dioProvider);
  return RegisterVehicleRepoImp(dio);
});

class ListOfYears extends Notifier<List<int>> {
  @override
  List<int> build() {
    final year = DateTime.now().add(Duration(days: 365)).year;
    return List.generate(50, (index) => index + (year - 50));
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

class RegisterVehicleNotifier
    extends Notifier<AsyncValue<DataApiResponse<VehicleResModel?>?>> {
  @override
  AsyncValue<DataApiResponse<VehicleResModel?>?> build() {
    return const AsyncValue.data(null);
  }

  void setLoading() {
    state = const AsyncValue.loading();
  }

  void setError(Object error, [StackTrace? stackTrace]) {
    state = AsyncValue.error(error, stackTrace ?? StackTrace.current);
  }

  void setSuccess(DataApiResponse<VehicleResModel?> data) {
    state = AsyncValue.data(data);
  }

  Future<bool> registerVehicle(VehicleEntity vehicle) async {
    setLoading();
    final storage = GetIt.instance<AuthSecureStorageService>();
    try {
      final token = await storage.getString(StorageKeys.driverToken);
      if (token == null) {
        setError(userNotFound.i18n);
        throw userNotFound.i18n;
      }

      final repo = ref.read(vehicleRepoProvider);
      final response = await repo.registerVehicle(vehicle, token);

      if (response.success) {
        setSuccess(response);
        return true;
      } else {
        final errorMsg = response.error?.details ?? response.message;
        setError(errorMsg);
        throw errorMsg;
      }
    } catch (e) {
      if (!state.hasError) {
        setError(e.toString());
      }
      rethrow;
    }
  }
}

final registerVehicleProvider =
    NotifierProvider<
      RegisterVehicleNotifier,
      AsyncValue<DataApiResponse<VehicleResModel?>?>
    >(RegisterVehicleNotifier.new);

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

  Future<bool> saveVehicleImages(List<VehicleImageEntity> vehicleImages) async {
    state = const AsyncValue.loading();
    final repo = ref.read(vehicleRepoProvider);
    final response = await repo.registerVehicleImages(vehicleImages);
    if (response.success) {
      state = AsyncValue.data(response);
      return true;
    } else {
      state = AsyncValue.error(response.message, StackTrace.current);
      return false;
    }
  }
}

final vehicleImagesSavingProvider =
    NotifierProvider<VehicleImagesSavingNotifier, AsyncValue<DataApiResponse?>>(
      VehicleImagesSavingNotifier.new,
    );
