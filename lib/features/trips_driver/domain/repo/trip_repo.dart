import 'package:dio/dio.dart';

abstract class TripRepo {
  Future<void> arriveState(String tripId, Dio dio);
  Future<void> startTrip(String tripId, Dio dio);
  Future<void> finishTrip(String tripId, Dio dio);
}
