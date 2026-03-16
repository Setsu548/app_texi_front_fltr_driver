import 'dart:convert';
import 'package:texi_driver/core/utils/dates_utilities.dart';
import 'package:texi_driver/features/register_driver/domain/entities/identification_entity.dart';

class IdentificationModel extends IdentificationEntity {
  IdentificationModel({
    required super.backDocument,
    required super.documentNumber,
    required super.documentType,
    required super.expireDate,
    required super.faceImage,
    required super.frontDocument,
    required super.uuid,
  });

  factory IdentificationModel.fromEntity(IdentificationEntity entity) =>
      IdentificationModel(
        backDocument: entity.backDocument,
        documentNumber: entity.documentNumber,
        documentType: entity.documentType,
        expireDate: entity.expireDate,
        faceImage: entity.faceImage,
        frontDocument: entity.frontDocument,
        uuid: entity.uuid,
      );

  IdentificationEntity toEntity() => IdentificationEntity(
    backDocument: backDocument,
    documentNumber: documentNumber,
    documentType: documentType,
    expireDate: expireDate,
    faceImage: faceImage,
    frontDocument: frontDocument,
    uuid: uuid,
  );

  IdentificationModel copyWith({
    String? backDocument,
    String? documentNumber,
    int? documentType,
    DateTime? expireDate,
    String? faceImage,
    String? frontDocument,
    String? uuid,
  }) => IdentificationModel(
    backDocument: backDocument ?? this.backDocument,
    documentNumber: documentNumber ?? this.documentNumber,
    documentType: documentType ?? this.documentType,
    expireDate: expireDate ?? this.expireDate,
    faceImage: faceImage ?? this.faceImage,
    frontDocument: frontDocument ?? this.frontDocument,
    uuid: uuid ?? this.uuid,
  );

  factory IdentificationModel.fromJson(Map<String, dynamic> json) =>
      IdentificationModel(
        backDocument: json['back_document'],
        documentNumber: json['document_number'],
        documentType: json['document_type'],
        expireDate: DateTime.parse(json['expire_date']),
        faceImage: json['face_image'],
        frontDocument: json['front_document'],
        uuid: json['uuid'],
      );

  Map<String, dynamic> toJson() => {
    'back_document': backDocument,
    'document_number': documentNumber,
    'document_type': documentType,
    'expire_date': DatesUtilities.dateToSave(expireDate),
    'face_image': faceImage,
    'front_document': frontDocument,
    'uuid': uuid,
  };

  String toRawJson() => jsonEncode(toJson());
}
