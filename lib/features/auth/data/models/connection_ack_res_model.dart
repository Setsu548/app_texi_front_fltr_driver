class ConnectionAckResModel {
  bool ok;
  DateTime serverTime;
  Profile profile;
  Status status;
  dynamic wallet;
  bool hasActiveTrip;
  dynamic activeTrip;

  ConnectionAckResModel({
    required this.ok,
    required this.serverTime,
    required this.profile,
    required this.status,
    this.wallet,
    required this.hasActiveTrip,
    this.activeTrip,
  });

  factory ConnectionAckResModel.fromJson(Map<String, dynamic> json) => ConnectionAckResModel(
    ok: json["ok"],
    serverTime: DateTime.parse(json["serverTime"]),
    profile: Profile.fromJson(json["profile"]),
    status: Status.fromJson(json["status"]),
    wallet: json["wallet"],
    hasActiveTrip: json["hasActiveTrip"],
    activeTrip: json["activeTrip"],
  );
}

class Profile {
  int driverId;
  String uuid;
  String userName;
  String userStatus;
  String? fullName;
  Vehicle vehicle;

  Profile({
    required this.driverId,
    required this.uuid,
    required this.userName,
    required this.userStatus,
    this.fullName,
    required this.vehicle,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    driverId: int.parse(json["driverId"]),
    uuid: json["uuid"],
    userName: json["userName"],
    userStatus: json["userStatus"],
    fullName: json["fullName"],
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );
}

class Vehicle {
  int id;
  String brand;
  String model;
  String licensePlate;
  int serviceTypeId;

  Vehicle({
    required this.id,
    required this.brand,
    required this.model,
    required this.licensePlate,
    required this.serviceTypeId,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: int.parse(json["id"]),
    brand: json["brand"],
    model: json["model"],
    licensePlate: json["licensePlate"],
    serviceTypeId: int.parse(json["serviceTypeId"]),
  );
}

class Status {
  bool isOnline;
  String availability;
  DateTime lastPing;

  Status({
    required this.isOnline,
    required this.availability,
    required this.lastPing,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    isOnline: json["isOnline"],
    availability: json["availability"],
    lastPing: DateTime.parse(json["lastPing"]),
  );
}