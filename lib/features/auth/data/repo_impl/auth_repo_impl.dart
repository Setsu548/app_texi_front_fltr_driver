import 'package:dio/dio.dart';
import 'package:texi/core/constants/data_api_response.dart';
import 'package:texi/features/auth/domain/entities/auth_entity.dart';
import 'package:texi/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final _dio = Dio();
  @override
  Future<DataApiResponse<bool>> login(AuthEntity authEntity) async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
