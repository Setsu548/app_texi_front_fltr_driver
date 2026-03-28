import 'package:dio/dio.dart';
import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/register_driver/data/models/data_check_model.dart';
import 'package:texi_driver/features/register_driver/data/models/document_type_model.dart';
import 'package:texi_driver/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi_driver/features/register_driver/data/models/driver_model.dart';
import 'package:texi_driver/features/register_driver/data/models/geo_data_res_model.dart';
import 'package:texi_driver/features/register_driver/data/models/identification_model.dart';
import 'package:texi_driver/features/register_driver/data/register_endpoints.dart';
import 'package:texi_driver/features/register_driver/domain/entities/document_type_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/identification_entity.dart';
import 'package:texi_driver/features/register_driver/domain/repo/driver_register_repo.dart';

class DriverRegisterRepoImpl implements DriverRegisterRepo {
  final Dio _dio;
  DriverRegisterRepoImpl(this._dio);

  @override
  Future<GeoDataResModel> getDepartments(String country) async {
    try {
      final response = await _dio.get('$departmentsEndpoint$country');
      if (response.statusCode != 200) {
        return GeoDataResModel.fromError(
          response.data,
          response.statusCode!,
          response.data['details'] as String,
        );
      }
      final resModel = GeoDataResModel.fromJson(response.data);
      return resModel;
    } on DioException catch (e) {
      return GeoDataResModel.fromError({}, 500, e.toString());
    }
  }

  @override
  Future<DataApiResponse<DriverDataResModel>> registerDriver(
    DriverEntity driver,
  ) async {
    try {
      final response = await _dio.post(
        registerDriverEndpoint,
        data: DriverModel.fromEntity(driver).toJson(),
      );
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<DriverDataResModel>.fromSuccess(
            response.data,
            (json) => DriverDataResModel.fromJson(json),
          );
        case 201:
          return DataApiResponse<DriverDataResModel>.fromJson(response.data);
        case 400:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 404:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 500:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 502:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        default:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
      }
    } on DioException catch (e) {
      return DataApiResponse<DriverDataResModel>.fromError(
        success: false,
        statusCode: e.response!.statusCode!,
        code: e.response!.data['code'] ?? '',
        message: e.response!.data['message'] ?? '',
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
  }

  @override
  Future<DataApiResponse<String?>> registerDriverIdentification(
    IdentificationEntity identification,
  ) async {
    final identificationModel = IdentificationModel.fromEntity(identification);
    try {
      final response = await _dio.post(
        registerDriverIdentificationEndpoint,
        data: identificationModel.toJson(),
      );
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<String?>.fromSuccess(response.data);
        case 201:
          return DataApiResponse.fromJson(response.data);
        case 404:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 500:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 502:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        default:
          return DataApiResponse.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
      }
    } on DioException catch (e) {
      return DataApiResponse.fromError(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: e.toString(),
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
  }

  @override
  Future<DataApiResponse<DriverDataResModel>> confirmDriverRegistration(
    String uuid,
  ) async {
    try {
      final response = await _dio.put(confirmRegister, data: {'uuid': uuid});
      switch (response.statusCode) {
        case 200:
          return DataApiResponse<DriverDataResModel>.fromJson(response.data);
        case 201:
          return DataApiResponse<DriverDataResModel>.fromJson(response.data);
        case 404:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 500:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        case 502:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
        default:
          return DataApiResponse<DriverDataResModel>.fromError(
            success: false,
            statusCode: response.statusCode!,
            code: response.data['code'] ?? '',
            message: response.data['message'] ?? '',
            error: ErrorResponse.fromJson(response.data['error']),
          );
      }
    } on DioException catch (e) {
      return DataApiResponse<DriverDataResModel>.fromError(
        success: false,
        statusCode: 500,
        code: 'Fail',
        message: e.toString(),
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
  }

  @override
  Future<DataApiResponse<PhoneChecked>> checkDriverPhone(String phone) async {
    try {
      final response = await _dio.get(
        checkDriverPhoneEndpoint,
        queryParameters: {'phone': phone},
      );
      if (response.statusCode == 200) {
        return DataApiResponse<PhoneChecked>.fromSuccess(
          response.data,
          (json) => PhoneChecked.fromJson(json),
        );
      }
    } on DioException catch (e) {
      return DataApiResponse<PhoneChecked>.fromError(
        success: false,
        statusCode: e.response!.statusCode!,
        code: e.response!.data['code'] ?? '',
        message: e.response!.data['message'] ?? '',
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
    return DataApiResponse<PhoneChecked>.fromError(
      success: false,
      statusCode: 500,
      code: 'Fail',
      message: 'Error al verificar el telefono',
      error: ErrorResponse.fromJson({}),
    );
  }

  @override
  Future<DataApiResponse<EmailChecked>> checkDriverEmail(String email) async {
    try {
      final response = await _dio.get(checkDriverEmailEndpoint(email));
      if (response.statusCode == 200) {
        return DataApiResponse<EmailChecked>.fromSuccess(
          response.data,
          (json) => EmailChecked.fromJson(json),
        );
      }
    } on DioException catch (e) {
      return DataApiResponse<EmailChecked>.fromError(
        success: false,
        statusCode: e.response!.statusCode!,
        code: e.response!.data['code'] ?? '',
        message: e.response!.data['message'] ?? '',
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
    return DataApiResponse<EmailChecked>.fromError(
      success: false,
      statusCode: 500,
      code: 'Fail',
      message: 'Error al verificar el correo',
      error: ErrorResponse.fromJson({}),
    );
  }

  @override
  Future<DataApiResponse<List<DocumentTypeEntity>>> getDocumentTypes() async {
    try {
      final response = await _dio.get(documentTypesEndpoint);
      if (response.statusCode == 200) {
        return DataApiResponse<List<DocumentTypeEntity>>.fromSuccess(
          response.data,
          (json) => (json as List<dynamic>)
              .map((e) => DocumentTypeModel.fromJson(e).toEntity())
              .toList(),
        );
      }
    } on DioException catch (e) {
      return DataApiResponse<List<DocumentTypeEntity>>.fromError(
        success: false,
        statusCode: e.response!.statusCode!,
        code: e.response!.data['code'] ?? '',
        message: e.response!.data['message'] ?? '',
        error: ErrorResponse.fromJson(e.response!.data['error']),
      );
    }
    return DataApiResponse<List<DocumentTypeEntity>>.fromError(
      success: false,
      statusCode: 500,
      code: 'Fail',
      message: 'Error al obtener los tipos de documento',
      error: ErrorResponse.fromJson({}),
    );
  }
}
