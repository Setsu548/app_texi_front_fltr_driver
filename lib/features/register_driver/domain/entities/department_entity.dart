import 'package:texi/features/register_driver/domain/entities/locality_entity.dart';

class DepartmentEntity {
  final String name;
  final List<LocalityEntity> localities;

  DepartmentEntity({required this.name, required this.localities});
}
