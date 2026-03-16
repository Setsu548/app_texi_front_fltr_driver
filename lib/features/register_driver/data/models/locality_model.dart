import 'package:texi_driver/features/register_driver/domain/entities/locality_entity.dart';

class LocalityModel extends LocalityEntity {
  LocalityModel({required super.id, required super.name});

  factory LocalityModel.fromJson(Map<String, dynamic> json) {
    return LocalityModel(id: json['id'] as int, name: json['name'] as String);
  }

  LocalityEntity toEntity() {
    return LocalityEntity(id: id, name: name);
  }
}
