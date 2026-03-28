import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:texi_driver/core/providers/dio_provider.dart';
import 'package:texi_driver/core/constants/enums.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/core/utils/image_picker_service.dart';
import 'package:texi_driver/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi_driver/features/register_driver/data/repo/driver_register_repo_impl.dart';
import 'package:texi_driver/features/register_driver/domain/entities/department_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/identification_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/locality_entity.dart';
import 'package:texi_driver/features/register_driver/domain/repo/driver_register_repo.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_identity_provider.dart';

final countriesListProvider =
    NotifierProvider<CountriesListProvider, List<Country>>(
      CountriesListProvider.new,
    );

/// Provider that returns a list of countries.
class CountriesListProvider extends Notifier<List<Country>> {
  @override
  List<Country> build() {
    final countries = Countries.list;
    final latamCountries = LatamCountries.values.map((e) => e.name).toList();
    return countries
        .where((element) => latamCountries.contains(element.name.toLowerCase()))
        .toList();
  }
}

final localCountryProvider = NotifierProvider<LocalCountryProvider, Country>(
  LocalCountryProvider.new,
);

class LocalCountryProvider extends Notifier<Country> {
  @override
  Country build() {
    final countries = ref.watch(countriesListProvider);
    return countries.firstWhere(
      (country) => country.name.toLowerCase() == 'bolivia',
    );
    /* return countries.firstWhere(
      (element) => element.code == I18n.locale.countryCode,
      orElse: () => countries.first,
    ); */
  }

  void setCountry(Country country) {
    state = country;
  }
}

final birthDateProvider = NotifierProvider<BirthDateProvider, DateTime>(
  BirthDateProvider.new,
);

class BirthDateProvider extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setBirthDate(DateTime birthDate) {
    state = birthDate;
  }
}

final genderProvider = NotifierProvider<GenderProvider, Gender>(
  GenderProvider.new,
);

/// Provider that manages the selected gender.
class GenderProvider extends Notifier<Gender> {
  @override
  Gender build() {
    return Gender.male;
  }

  void setGender(Gender gender) {
    state = gender;
  }
}

/// Provider that returns an instance of the [DriverRegisterRepo].
final driverRegisterRepoProvider = Provider<DriverRegisterRepo>((ref) {
  final dio = ref.read(dioProvider);
  return DriverRegisterRepoImpl(dio);
});

class RegisterProccessNotifier extends Notifier<AsyncValue<String>> {
  @override
  AsyncValue<String> build() {
    return const AsyncValue.data('');
  }

  void setLoading() {
    state = const AsyncValue.loading();
  }

  void setError(Object error, [StackTrace? stackTrace]) {
    state = AsyncValue.error(error, stackTrace ?? StackTrace.current);
  }

  void setSuccess([String message = '']) {
    state = AsyncValue.data(message);
  }

  Future<bool> registerDriver(DriverEntity driver) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final repo = ref.read(driverRegisterRepoProvider);
    final response = await repo.registerDriver(driver);
    final driverRes = response.data;
    if (driverRes == null) {
      throw response.error?.details ?? 'Error';
    }
    await storage.saveToken(StorageKeys.driverRegister, driverRes.toRawJson());
    return true;
  }

  Future<bool> registerDriverIdentification() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final repo = ref.read(driverRegisterRepoProvider);
    final rawDriverRegistered = await storage.getString(
      StorageKeys.driverRegister,
    );
    if (rawDriverRegistered == null) {
      throw (driverInfoNotFound.i18n);
    }
    final driverRegistered = DriverDataResModel.fromRawJson(
      rawDriverRegistered,
    );
    final back = await ImagePickerService.imageToBase64(
      ref.read(backIdentificationProvider).value!,
    );
    final face = await ImagePickerService.imageToBase64(
      ref.read(profileImageProvider).value!,
    );
    final front = await ImagePickerService.imageToBase64(
      ref.read(frontIdentificationProvider).value!,
    );
    final identification = IdentificationEntity(
      backDocument: back!,
      documentNumber: ref.read(identificationNumberProvider),
      documentType: 1,
      expireDate: ref.read(idExpirationDateProvider),
      faceImage: face!,
      frontDocument: front!,
      uuid: driverRegistered.uuid,
    );
    final response = await repo.registerDriverIdentification(identification);
    print(response.data);
    if (response.success) {
      return true;
    } else {
      throw (response.error!.details);
    }
  }

  Future<bool> registerDriverLicense() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final repo = ref.read(driverRegisterRepoProvider);
    final rawDriverRegistered = await storage.getString(
      StorageKeys.driverRegister,
    );
    if (rawDriverRegistered == null) {
      throw (driverInfoNotFound.i18n);
    }
    final driverRegistered = DriverDataResModel.fromRawJson(
      rawDriverRegistered,
    );
    final back = await ImagePickerService.imageToBase64(
      ref.read(backLicenseProvider).value!,
    );
    final face = await ImagePickerService.imageToBase64(
      ref.read(profileImageProvider).value!,
    );
    final front = await ImagePickerService.imageToBase64(
      ref.read(frontLicenseProvider).value!,
    );
    final identification = IdentificationEntity(
      backDocument: back!,
      documentNumber: ref.read(identificationNumberProvider),
      documentType: ref.read(selectedDocumentTypeProvider)!.id,
      expireDate: ref.read(licenseExpirationDateProvider),
      faceImage: face!,
      frontDocument: front!,
      uuid: driverRegistered.uuid,
    );

    final response = await repo.registerDriverIdentification(identification);

    if (response.success) {
      return true;
    } else {
      throw (response.error!.details);
    }
  }

  Future<bool> updateDriverRegistration() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final repo = ref.read(driverRegisterRepoProvider);
    final driverRegister = await storage.getString(StorageKeys.driverRegister);
    if (driverRegister != null) {
      final driver = DriverDataResModel.fromRawJson(driverRegister);
      final res = await repo.confirmDriverRegistration(driver.uuid);
      if (res.success) {
        return true;
      } else {
        throw (res.error!.details);
      }
    } else {
      throw (driverInfoExeption.i18n);
    }
  }
}

final driverRegisterProccessProvider =
    NotifierProvider<RegisterProccessNotifier, AsyncValue<String>>(
      RegisterProccessNotifier.new,
    );

//Department Provider
//It manages the list of departments by a selected country
class DepartmentsListProvider
    extends Notifier<AsyncValue<List<DepartmentEntity>>> {
  @override
  AsyncValue<List<DepartmentEntity>> build() {
    final country = ref.watch(localCountryProvider);
    final repo = ref.watch(driverRegisterRepoProvider);

    _fetchDepartments(country.name, repo);
    return const AsyncValue.loading();
  }

  Future<void> _fetchDepartments(
    String countryName,
    DriverRegisterRepo repo,
  ) async {
    try {
      final result = await repo.getDepartments(countryName);
      if (result.data != null) {
        state = AsyncValue.data(result.data!.departments);
      } else {
        state = AsyncValue.error(
          'Failed to load departments',
          StackTrace.current,
        );
      }
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final departmentsListProvider =
    NotifierProvider<
      DepartmentsListProvider,
      AsyncValue<List<DepartmentEntity>>
    >(DepartmentsListProvider.new);

//Department Selected Provider
//It manages the selected department
class DepartmentSelectedProvider extends Notifier<DepartmentEntity> {
  @override
  DepartmentEntity build() {
    final department = ref.watch(departmentsListProvider);
    return department.when(
      data: (data) {
        return data.first;
      },
      error: (error, stack) {
        return DepartmentEntity(name: '', localities: []);
      },
      loading: () {
        return DepartmentEntity(name: '', localities: []);
      },
    );
  }

  void setDepartment(DepartmentEntity department) {
    state = department;
  }
}

final departmentSelectedProvider =
    NotifierProvider<DepartmentSelectedProvider, DepartmentEntity>(
      DepartmentSelectedProvider.new,
    );

class LocalitiesListProvider extends AsyncNotifier<List<LocalityEntity>> {
  @override
  Future<List<LocalityEntity>> build() async {
    final department = ref.watch(departmentSelectedProvider);
    return department.localities;
  }
}

final localitiesListProvider =
    AsyncNotifierProvider<LocalitiesListProvider, List<LocalityEntity>>(
      LocalitiesListProvider.new,
    );

class LocalitySelectedProvider extends Notifier<LocalityEntity> {
  @override
  LocalityEntity build() {
    final locality = ref.watch(localitiesListProvider);
    return locality.when(
      data: (data) {
        if (data.isNotEmpty) {
          return data.first;
        }
        return LocalityEntity(id: 0, name: '');
      },
      error: (error, stack) {
        return LocalityEntity(id: 0, name: '');
      },
      loading: () {
        return LocalityEntity(id: 0, name: '');
      },
    );
  }

  void setLocality(LocalityEntity locality) {
    state = locality;
  }
}

final localitySelectedProvider =
    NotifierProvider<LocalitySelectedProvider, LocalityEntity>(
      LocalitySelectedProvider.new,
    );
