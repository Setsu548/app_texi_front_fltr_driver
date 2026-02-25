class IdentificationEntity {
  final String backDocument;
  final String documentNumber;
  final int documentType;
  final DateTime expireDate;
  final String faceImage;
  final String frontDocument;
  final String uuid;

  IdentificationEntity({
    required this.backDocument,
    required this.documentNumber,
    required this.documentType,
    required this.expireDate,
    required this.faceImage,
    required this.frontDocument,
    required this.uuid,
  });
}
