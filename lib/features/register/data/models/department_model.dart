import 'package:texi/features/register/data/models/locality_model.dart';
import 'package:texi/features/register/domain/entities/department_entity.dart';

class DepartmentModel extends DepartmentEntity {
  DepartmentModel({required super.name, required super.localities});

  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    final localitiesList = json['localities'] as List;
    return DepartmentModel(
      name: json['name'],
      localities: localitiesList
          .map((locality) => LocalityModel.fromJson(locality))
          .toList(),
    );
  }

  DepartmentEntity toEntity() {
    return DepartmentEntity(name: name, localities: localities);
  }
}
