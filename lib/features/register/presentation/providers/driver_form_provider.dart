import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/features/register/data/models/driver_data_res_model.dart';
import 'package:texi/features/register/data/repo/driver_register_repo_impl.dart';
import 'package:texi/features/register/domain/entities/department_entity.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';
import 'package:texi/features/register/domain/entities/locality_entity.dart';
import 'package:texi/features/register/domain/repo/driver_register_repo.dart';

final countriesListProvider =
    NotifierProvider<CountriesListProvider, List<Country>>(
      CountriesListProvider.new,
    );

/// Provider that returns a list of countries.
class CountriesListProvider extends Notifier<List<Country>> {
  @override
  List<Country> build() {
    return Countries.list;
  }
}

final localCountryProvider = NotifierProvider<LocalCountryProvider, Country>(
  LocalCountryProvider.new,
);

/// Provider that manages the currently selected country.
/// Defaults to the country matching the current locale or the first in the list.
class LocalCountryProvider extends Notifier<Country> {
  @override
  Country build() {
    final countries = ref.watch(countriesListProvider);
    return countries.firstWhere(
      (element) => element.code == I18n.locale.countryCode,
      orElse: () => countries.first,
    );
  }

  void setCountry(Country country) {
    state = country;
  }
}

final birthDateProvider = NotifierProvider<BirthDateProvider, DateTime>(
  BirthDateProvider.new,
);

/// Provider that manages the selected birth date.
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
  return DriverRegisterRepoImpl();
});

/// Notifier that handles the driver registration process.
/// It manages the loading, success, and error states of the registration.
class DriverRegisterNotifier
    extends Notifier<AsyncValue<DataApiResponse<DriverDataModel>?>> {
  @override
  AsyncValue<DataApiResponse<DriverDataModel>?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> register(DriverEntity driver) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(driverRegisterRepoProvider);
      final result = await repo.registerDriver(driver);
      state = AsyncValue.data(result);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}

final driverRegisterProvider =
    NotifierProvider<
      DriverRegisterNotifier,
      AsyncValue<DataApiResponse<DriverDataModel>?>
    >(DriverRegisterNotifier.new);

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
  FutureOr<List<LocalityEntity>> build() async {
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
