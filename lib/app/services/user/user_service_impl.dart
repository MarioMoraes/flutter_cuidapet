import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cuidapet/app/core/exceptions/failure.dart';
import 'package:flutter_cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet/app/repositories/user/user_repository.dart';

import './user_service.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _appLogger;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger appLogger,
  })  : _appLogger = appLogger,
        _userRepository = userRepository;

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethodsLogin =
          await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethodsLogin.isNotEmpty) {
        throw UserExistsException();
      }

      // Cria Usuario no BackEnd
      await _userRepository.register(email, password);
      // Cria Usuario no Firebase
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Envia Email de Confirmação
      await userCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _appLogger.error('Erro Ao Criar Usuario no Firebase', e, s);
      throw Failure(message: 'Erro Ao Criar Usuário no Firebase');
    }
  }
}
