import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/trips_driver/data/model/trip_status_res_model.dart';
import 'package:texi_driver/features/trips_driver/data/trip_end_points.dart';
import 'package:texi_driver/features/trips_driver/domain/entities/trip_status_res_entity.dart';
import 'package:texi_driver/features/trips_driver/domain/repo/trip_repo.dart';

class TripRepoImpl implements TripRepo {
  @override
  Future<DataApiResponse<TripStatusResEntity>> acceptTrip(
    String tripId,
    Dio dio,
  ) async {
    try {
      final url = acceptOfferUrl(tripId);
      final response = await dio.post(url);
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<TripStatusResEntity>.fromSuccess(
            response.data,
            (data) => TripStatusResModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  @override
  Future<DataApiResponse<TripStatusResEntity>> arriveState(
    String tripId,
    Dio dio,
  ) async {
    try {
      final url = arriveStateUrl(tripId);
      final response = await dio.post(url);
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<TripStatusResEntity>.fromSuccess(
            response.data,
            (data) => TripStatusResModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  @override
  Future<DataApiResponse<TripStatusResEntity>> finishTrip(
    String tripId,
    Dio dio,
  ) async {
    try {
      final response = await dio.post(finishTripUrl(tripId));
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<TripStatusResEntity>.fromSuccess(
            response.data,
            (data) => TripStatusResModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }

  @override
  Future<DataApiResponse<TripStatusResEntity>> startTrip(
    String tripId,
    Dio dio,
  ) async {
    try {
      final response = await dio.post(startTripUrl(tripId));
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<TripStatusResEntity>.fromSuccess(
            response.data,
            (data) => TripStatusResModel.fromJson(data).toEntity(),
          );
        default:
          throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      throw Exception(e.response?.data['message']);
    }
  }
}
