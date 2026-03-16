import 'package:dio/dio.dart';
import 'package:texi_driver/features/trips_driver/data/trip_end_points.dart';
import 'package:texi_driver/features/trips_driver/domain/repo/trip_repo.dart';

class TripRepoImpl implements TripRepo {
  @override
  Future<void> arriveState(String tripId, Dio dio) async {
    try {
      final url = arriveStateUrl(tripId);
      final response = await dio.post(url);
      print(response.data);
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> finishTrip(String tripId, Dio dio) async {
    try {
      final response = await dio.post(finishTripUrl(tripId));
      print(response.data);
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> startTrip(String tripId, Dio dio) async {
    try {
      final response = await dio.post(startTripUrl(tripId));
      print(response.data);
      if (response.statusCode == 200) {
        return;
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
