import 'package:flutter_cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet/app/core/widgets/loader.dart';
import 'package:flutter_cuidapet/app/core/widgets/messages.dart';
import 'package:flutter_cuidapet/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AppLogger _appLogger;
  final UserService _userService;

  _RegisterControllerBase({
    required AppLogger appLogger,
    required UserService userService,
  })  : _appLogger = appLogger,
        _userService = userService;

  void register({required String email, required String password}) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert('Email Já Utilizado! Tente Outro!');
    } catch (e, s) {
      Loader.hide();
      _appLogger.error('Erro Ao Registrar Usuario', e, s);
      Messages.alert('Erro Ao Registrar Usuário');
    }
  }
}
