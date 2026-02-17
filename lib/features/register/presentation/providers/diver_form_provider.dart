import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:phonecodes/phonecodes.dart';

class CountriesListProvider extends Notifier<List<Country>> {
  @override
  List<Country> build() {
    return Countries.list;
  }
}

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

class BirthDateProvider extends Notifier<DateTime> {
  @override
  DateTime build() {
    return DateTime.now();
  }

  void setBirthDate(DateTime birthDate) {
    state = birthDate;
  }
}

final countriesListProvider =
    NotifierProvider<CountriesListProvider, List<Country>>(
      CountriesListProvider.new,
    );

final localCountryProvider = NotifierProvider<LocalCountryProvider, Country>(
  LocalCountryProvider.new,
);

final birthDateProvider = NotifierProvider<BirthDateProvider, DateTime>(
  BirthDateProvider.new,
);
