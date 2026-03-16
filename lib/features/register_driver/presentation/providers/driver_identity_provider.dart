import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/core/utils/image_picker_service.dart';
import 'package:texi_driver/features/register_driver/domain/entities/identification_entity.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_form_provider.dart';

class IdentificationNumberNotifier extends Notifier<String> {
  @override
  String build() {
    return '';
  }

  void setNumeroIdentification(String numeroIdentification) {
    state = numeroIdentification;
  }
}

final identificationNumberProvider =
    NotifierProvider<IdentificationNumberNotifier, String>(
      IdentificationNumberNotifier.new,
    );

class IdExpirationDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setExpirationDate(DateTime date) {
    state = date;
  }
}

final idExpirationDateProvider =
    NotifierProvider<IdExpirationDateNotifier, DateTime>(
      IdExpirationDateNotifier.new,
    );

class FrontIdentificationNotifier extends Notifier<AsyncValue<File?>> {
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

final frontIdentificationProvider =
    NotifierProvider<FrontIdentificationNotifier, AsyncValue<File?>>(
      FrontIdentificationNotifier.new,
    );

class BackIdentificationNotifier extends Notifier<AsyncValue<File?>> {
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

final backIdentificationProvider =
    NotifierProvider<BackIdentificationNotifier, AsyncValue<File?>>(
      BackIdentificationNotifier.new,
    );

class ProfileImageNotifier extends Notifier<AsyncValue<File?>> {
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

final profileImageProvider =
    NotifierProvider<ProfileImageNotifier, AsyncValue<File?>>(
      ProfileImageNotifier.new,
    );

class DriverIdentityRegistrationNotifier
    extends Notifier<AsyncValue<DataApiResponse<String?>>> {
  @override
  AsyncValue<DataApiResponse<String?>> build() {
    final res = DataApiResponse<String?>(
      code: 'EMPTY_DATA',
      success: false,
      statusCode: 201,
      message: 'Init Values',
      data: null,
      error: null,
    );
    return AsyncValue.data(res);
  }

  Future<void> register(IdentificationEntity identification) async {
    state = const AsyncValue.loading();
    final repo = ref.read(driverRegisterRepoProvider);
    final result = await repo.registerDriverIdentification(identification);
    state = AsyncValue.data(result);
  }
}

final driverIdentityRegistrationProvider =
    NotifierProvider<
      DriverIdentityRegistrationNotifier,
      AsyncValue<DataApiResponse<String?>>
    >(DriverIdentityRegistrationNotifier.new);

class LicenseExpirationDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setExpirationDate(DateTime date) {
    state = date;
  }
}

final licenseExpirationDateProvider =
    NotifierProvider<LicenseExpirationDateNotifier, DateTime>(
      LicenseExpirationDateNotifier.new,
    );

class FrontLicenseNotifier extends Notifier<AsyncValue<File?>> {
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

final frontLicenseProvider =
    NotifierProvider<FrontLicenseNotifier, AsyncValue<File?>>(
      FrontLicenseNotifier.new,
    );

class BackLicenseNotifier extends Notifier<AsyncValue<File?>> {
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

final backLicenseProvider =
    NotifierProvider<BackLicenseNotifier, AsyncValue<File?>>(
      BackLicenseNotifier.new,
    );
