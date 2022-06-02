import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet/app/core/widgets/loader.dart';
import 'package:flutter_cuidapet/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AppLogger? _appLogger;
  final UserService? _userService;

  _RegisterControllerBase({
    required AppLogger appLogger,
    required UserService userService,
  })  : _appLogger = appLogger,
        _userService = userService;

  void register({required String login, required String senha}) {
    Loader.show();
    Future.delayed(const Duration(seconds: 3));
    Loader.hide();
  }
}
