import 'package:flutter_dotenv/flutter_dotenv.dart';

final String registerDriverEndpoint =
    '${dotenv.env['BASE_URL']}/users/driver/personal-info';
