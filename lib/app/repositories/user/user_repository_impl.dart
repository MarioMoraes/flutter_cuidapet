import 'package:flutter_cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_client_exception.dart';

import './user_repository.dart';
import '../../core/exceptions/failure.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _appLogger;

  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger appLogger,
  })  : _restClient = restClient,
        _appLogger = appLogger;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient.unAuth().post('auth/register', data: {
        'email': email,
        'password': password,
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400 &&
          e.response.data['message'] == 'Usuário Já Cadastrado') {
        _appLogger.error(e.error, e, s);
        throw UserExistsException();
      }
      _appLogger.error('Erro Ao Cadastrar Usuário', e, s);
      throw Failure(message: 'Erro Ao Registrar Usuário');
    }
  }
}
