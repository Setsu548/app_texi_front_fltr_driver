import 'package:texi/features/register_driver/data/models/department_model.dart';
import 'package:texi/features/register_driver/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({required super.country, required super.departments});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    final departmentsList = json['departments'] as List;
    return CountryModel(
      country: json['country'] as String,
      departments: departmentsList
          .map((department) => DepartmentModel.fromJson(department))
          .toList(),
    );
  }

  CountryEntity toEntity() {
    return CountryEntity(country: country, departments: departments);
  }
}
