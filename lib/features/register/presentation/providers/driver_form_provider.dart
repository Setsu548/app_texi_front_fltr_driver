import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:phonecodes/phonecodes.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/core/constants/enums.dart';
import 'package:texi/features/register/data/models/driver_data_res_model.dart';
import 'package:texi/features/register/data/repo/driver_register_repo_impl.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';
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
