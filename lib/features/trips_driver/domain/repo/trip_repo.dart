import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/trips_driver/domain/entities/trip_status_res_entity.dart';

abstract class TripRepo {
  Future<DataApiResponse<TripStatusResEntity>> acceptTrip(String tripId, Dio dio);
  Future<DataApiResponse<TripStatusResEntity>> arriveState(String tripId, Dio dio);
  Future<DataApiResponse<TripStatusResEntity>> startTrip(String tripId, Dio dio);
  Future<DataApiResponse<TripStatusResEntity>> finishTrip(String tripId, Dio dio);
}
