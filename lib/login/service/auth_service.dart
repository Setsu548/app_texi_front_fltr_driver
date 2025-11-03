// lib/data/services/auth_service.dart
import 'package:dio/dio.dart';
import '../../app/api_dio.dart';
import '../../app/api_response.dart';
import '../models/document_info.dart';
import '../models/login_response.dart';
import '../models/personal_info_model.dart';
import '../models/vehicle_images_card.dart';
import '../models/vehicle_model.dart';

class AuthService {
  final ApiDio _api = ApiDio();

  Future<ApiResponse<LoginResponse>> login(String email, String password, String brand, String model, String os, String ip) async {
    try {
      final response = await _api.dio.post(
        '/auth/login',
        data: {'user_name': email, 'password': password,"brand": brand, "model": model, "os": os, "ip": ip},
      );

      return ApiResponse<LoginResponse>.fromJson(
        response.data,
        (data) => LoginResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Error de conexión';
      throw Exception('Error en login: $message');
    }
  }

  Future<ApiResponse<LogoutResponse>> logout() async {
    try {
      final response = await _api.dio.get(
        '/auth/logout'
      );

      return ApiResponse<LogoutResponse>.fromJson(
        response.data,
        (data) => LogoutResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Error de conexión';
      throw Exception('Error en login: $message');
    }
  }
  
  Future<ApiResponse<PersonalInfoResponse>> personalInfo(PersonalInfoModel personalInfo) async {
    try {
      final response = await _api.dio.post(
        '/users/driver/personal-info',
        data: personalInfo.toJson(),
      );

      return ApiResponse<PersonalInfoResponse>.fromJson(
        response.data,
        (data) => PersonalInfoResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }
  Future<ApiResponse<UpdateUser>> updateUser(String uuid) async {
    try {
      final response = await _api.dio.put(
        '/users/driver/update-user',
        data: {'uuid': uuid},
      );

      return ApiResponse<UpdateUser>.fromJson(
        response.data,
        (data) => UpdateUser.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<DocumentInfoResponse>> documentInfo(DocumentInfo documentInfo) async {
    try {
      final response = await _api.dio.post(
        '/users/driver/document-info',
        data: documentInfo.toJson(),
      );

      return ApiResponse<DocumentInfoResponse>.fromJson(
        response.data,
        (data) => DocumentInfoResponse.fromJson(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<VehicleResponse>> vehicleRegister(VehicleModel vehicleModel) async {
    try {
      final response = await _api.dio.post(
        '/users/vehicle',
        data: vehicleModel.toJson(),
      );

      return ApiResponse<VehicleResponse>.fromJson(
        response.data,
        (data) => VehicleResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<VehicleImagesCardResponse>> vehicleImagesCar(VehicleImagesCard vehicleImagesCar) async {
    try {
      final response = await _api.dio.post(
        '/users/vehicle/images-car',
        data: vehicleImagesCar.toJson(),
      );

      return ApiResponse<VehicleImagesCardResponse>.fromJson(
        response.data,
        (data) => VehicleImagesCardResponse.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<List<VehicleModel>>> usersVehicle(String plate) async {
    try {
      var vehiclePlate = plate.isNotEmpty ? '/$plate' : '';

      final response = await _api.dio.get('/users/vehicle$vehiclePlate');

      return ApiResponse<List<VehicleModel>>.fromJson(
        response.data,
        (data) => (data as List<dynamic>)
            .map((item) => VehicleModel.fromMap(item as Map<String, dynamic>))
            .toList(),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

  Future<ApiResponse<VehicleUpdate>> updateVehicle(String uuid) async {
    try {
      final response = await _api.dio.put(
        '/users/vehicle?uuid=$uuid',
      );

      return ApiResponse<VehicleUpdate>.fromJson(
        response.data,
        (data) => VehicleUpdate.fromMap(data),
      );
    } on DioException catch (e) {
      final data = e.response?.data;
      final message = data?['message'] ?? 'Error de conexión';
      final details = data?['error']?['details'] ?? '';
      throw {
        'message': message,
        'details': details,
      };
    }
  }

}
