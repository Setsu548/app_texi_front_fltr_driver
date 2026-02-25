import 'package:texi/features/register_driver/domain/entities/department_entity.dart';

class CountryEntity {
  final String country;
  final List<DepartmentEntity> departments;

  CountryEntity({required this.country, required this.departments});
}
