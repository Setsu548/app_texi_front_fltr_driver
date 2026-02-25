import 'package:flutter_dotenv/flutter_dotenv.dart';

final String registerDriverEndpoint = '/users/driver/personal-info';
final String departmentsEndpoint = '${dotenv.env['GEO_URL']}/geo/full-tree/';
final String registerDriverIdentificationEndpoint =
    '/users/driver/document-info';
final String confirmRegister = '/users/driver/update-user';
