class TravelModel {
  final String originTime;
  final String originDescription;
  final String destinationDescription;
  final double distance;
  final int estimatedTime;
  final double earnings;
  final String avatarUrl;
  final String nameDriver;
  final double ratingDriver;

  TravelModel({
    required this.originTime,
    required this.originDescription,
    required this.destinationDescription,
    required this.distance,
    required this.estimatedTime,
    required this.earnings,
    required this.avatarUrl,
    required this.nameDriver,
    required this.ratingDriver,
  });

  factory TravelModel.fromFirebase(Map<String, dynamic> json) {
    return TravelModel(
      originTime: '5 min',
      originDescription: json['pasanger_start'],
      destinationDescription: json['pasanger_end'],
      distance: json['distance_km'] / 1,
      estimatedTime: json['time_min'] ~/ 1,
      earnings: json['amount'] / 1,
      avatarUrl: 'assets/images/texi.png',
      nameDriver: json['full_name'],
      ratingDriver: 4.8,
    );
  }
}
