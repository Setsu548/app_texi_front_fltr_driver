import 'package:flutter_dotenv/flutter_dotenv.dart';

final String registerDriverEndpoint = '/users/driver/personal-info';
final String departmentsEndpoint = '${dotenv.env['GEO_URL']}/geo/full-tree/';
final String registerDriverIdentificationEndpoint =
    '/users/driver/document-info';
final String confirmRegister = '/users/driver/update-user';
final String getDriverInfoEndpoint = '/users/driver/personal-info?uuid=';
final String checkDriverPhoneEndpoint = '/users/verify-phone';
String checkDriverEmailEndpoint(String email) =>
    '/users/verify-email?email=$email';
final String documentTypesEndpoint = '/document-type';
