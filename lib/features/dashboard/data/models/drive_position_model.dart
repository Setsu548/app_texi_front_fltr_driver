class DrivePositionModel {
  final double lat;
  final double lng;
  final int bearing;
  final int speed;

  DrivePositionModel({
    required this.lat,
    required this.lng,
    required this.bearing,
    required this.speed,
  });

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng, 'bearing': bearing, 'speed': speed};
  }
}
