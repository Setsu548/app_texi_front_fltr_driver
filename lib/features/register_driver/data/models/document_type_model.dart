import 'package:texi_driver/features/register_driver/domain/entities/document_type_entity.dart';

class DocumentTypeModel {
  final int id;
  final String documentTypeName;
  final String description;

  DocumentTypeModel({
    required this.id,
    required this.documentTypeName,
    required this.description,
  });

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) {
    return DocumentTypeModel(
      id: json['id'],
      documentTypeName: json['document_type_name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'document_type_name': documentTypeName,
      'description': description,
    };
  }

  DocumentTypeEntity toEntity() {
    return DocumentTypeEntity(
      id: id,
      documentTypeName: documentTypeName,
      description: description,
    );
  }

  factory DocumentTypeModel.fromEntity(DocumentTypeEntity entity) {
    return DocumentTypeModel(
      id: entity.id,
      documentTypeName: entity.documentTypeName,
      description: entity.description,
    );
  }
}
