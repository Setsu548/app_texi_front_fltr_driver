class TravelModel {
  final String id;
  final String originTime;
  final String originDescription;
  final String destinationDescription;
  final double distance;
  final int estimatedTime;
  final double earnings;
  final String avatarUrl;
  final String nameDriver;
  final double ratingDriver;

  // passanger
  final double pasangerStartLat;
  final double pasangerStartLng;
  final double pasangerEndLat;
  final double pasangerEndLng;

  // current driver location
  final double currentRouteLat;
  final double currentRouteLng;

  TravelModel({
    required this.id,
    required this.originTime,
    required this.originDescription,
    required this.destinationDescription,
    required this.distance,
    required this.estimatedTime,
    required this.earnings,
    required this.avatarUrl,
    required this.nameDriver,
    required this.ratingDriver,
    required this.pasangerStartLat,
    required this.pasangerStartLng,
    required this.pasangerEndLat,
    required this.pasangerEndLng,
    required this.currentRouteLat,
    required this.currentRouteLng,
  });

  factory TravelModel.fromFirebase(Map<String, dynamic> json) {
    return TravelModel(
      originTime: '5 min',
      id: json['id'],
      originDescription: json['pasanger_start'],
      destinationDescription: json['pasanger_end'],
      distance: json['distance_km'] / 1,
      estimatedTime: json['time_min'] ~/ 1,
      earnings: json['amount'] / 1,
      avatarUrl: 'assets/images/texi.png',
      nameDriver: json['full_name'],
      ratingDriver: 4.8,
      pasangerStartLat: json['pasanger_start_lat'] / 1,
      pasangerStartLng: json['pasanger_start_lng'] / 1,
      pasangerEndLat: json['pasanger_end_lat'] / 1,
      pasangerEndLng: json['pasanger_end_lng'] / 1,
      currentRouteLat: json['current_route_lat'] / 1,
      currentRouteLng: json['current_route_lng'] / 1,
    );
  }
}
