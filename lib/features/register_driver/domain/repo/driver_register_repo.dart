import 'package:texi_driver/core/constants/data_api_response.dart';
import 'package:texi_driver/features/register_driver/data/models/data_check_model.dart';
import 'package:texi_driver/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi_driver/features/register_driver/data/models/geo_data_res_model.dart';
import 'package:texi_driver/features/register_driver/domain/entities/document_type_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi_driver/features/register_driver/domain/entities/identification_entity.dart';

abstract class DriverRegisterRepo {
  Future<DataApiResponse<DriverDataResModel>> registerDriver(
    DriverEntity driver,
  );
  Future<GeoDataResModel> getDepartments(String country);
  Future<DataApiResponse<String?>> registerDriverIdentification(
    IdentificationEntity identification,
  );
  Future<DataApiResponse<DriverDataResModel>> confirmDriverRegistration(
    String uuid,
  );
  Future<DataApiResponse<PhoneChecked>> checkDriverPhone(String phone);
  Future<DataApiResponse<EmailChecked>> checkDriverEmail(String email);
  Future<DataApiResponse<List<DocumentTypeEntity>>> getDocumentTypes();
}
