// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DocumentInfo {
  final String? uuid;
	final int documentType;
	final String documentNumber;
	final String frontDocument;
	final String backDocument;
	final String faceImage;
	final String expireDate;
  DocumentInfo({
    this.uuid,
    required this.documentType,
    required this.documentNumber,
    required this.frontDocument,
    required this.backDocument,
    required this.faceImage,
    required this.expireDate,
  });

  DocumentInfo copyWith({
    String? uuid,
    int? documentType,
    String? documentNumber,
    String? frontDocument,
    String? backDocument,
    String? faceImage,
    String? expireDate,
  }) {
    return DocumentInfo(
      uuid: uuid ?? this.uuid,
      documentType: documentType ?? this.documentType,
      documentNumber: documentNumber ?? this.documentNumber,
      frontDocument: frontDocument ?? this.frontDocument,
      backDocument: backDocument ?? this.backDocument,
      faceImage: faceImage ?? this.faceImage,
      expireDate: expireDate ?? this.expireDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'document_type': documentType,
      'documentNumber': documentNumber,
      'front_document': frontDocument,
      'back_document': backDocument,
      'face_image': faceImage,
      'expire_date': expireDate,
    };
  }

  factory DocumentInfo.fromMap(Map<String, dynamic> map) {
    return DocumentInfo(
      uuid: map['uuid'] != null ? map['uuid'] as String : null,
      documentType: map['document_type'] as int,
      documentNumber: map['documentNumber'] as String,
      frontDocument: map['front_document'] as String,
      backDocument: map['back_document'] as String,
      faceImage: map['face_image'] as String,
      expireDate: map['expire_date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentInfo.fromJson(String source) => DocumentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DocumentInfo(uuid: $uuid, documentType: $documentType, documentNumber: $documentNumber, frontDocument: $frontDocument, backDocument: $backDocument, faceImage: $faceImage, expireDate: $expireDate)';
  }

  @override
  bool operator ==(covariant DocumentInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.uuid == uuid &&
      other.documentType == documentType &&
      other.documentNumber == documentNumber &&
      other.frontDocument == frontDocument &&
      other.backDocument == backDocument &&
      other.faceImage == faceImage &&
      other.expireDate == expireDate;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
      documentType.hashCode ^
      documentNumber.hashCode ^
      frontDocument.hashCode ^
      backDocument.hashCode ^
      faceImage.hashCode ^
      expireDate.hashCode;
  }
}

class DocumentInfoResponse {
  final String data;

  DocumentInfoResponse({required this.data,});

  factory DocumentInfoResponse.fromJson(Map<String, dynamic> json) {
    return DocumentInfoResponse(
      data: json['data'] ?? '',
    );
  }
}
