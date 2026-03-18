import 'package:texi_driver/features/auth/data/models/connection_ack_res_model.dart';

class ProfileState {
  final int? driverId;
  final String? uuid;
  final String? userName;
  final String? userStatus;
  final String? fullName;
  final Vehicle? vehicle;

  ProfileState({
    this.driverId,
    this.uuid,
    this.userName,
    this.userStatus,
    this.fullName,
    this.vehicle,
  });

  factory ProfileState.fromProfile(Profile profile) {
    return ProfileState(
      driverId: profile.driverId,
      uuid: profile.uuid,
      userName: profile.userName,
      userStatus: profile.userStatus,
      fullName: profile.fullName,
      vehicle: profile.vehicle,
    );
  }

  ProfileState copyWith({
    int? driverId,
    String? uuid,
    String? userName,
    String? userStatus,
    String? fullName,
    Vehicle? vehicle,
  }) {
    return ProfileState(
      driverId: driverId ?? this.driverId,
      uuid: uuid ?? this.uuid,
      userName: userName ?? this.userName,
      userStatus: userStatus ?? this.userStatus,
      fullName: fullName ?? this.fullName,
      vehicle: vehicle ?? this.vehicle,
    );
  }
}
