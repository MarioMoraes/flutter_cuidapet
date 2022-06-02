import 'package:flutter_cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:flutter_cuidapet/app/modules/auth/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => RegisterController(appLogger: i(), userService: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => const RegisterPage(),
      transition: TransitionType.upToDown,
      duration: const Duration(milliseconds: 600),
    ),
  ];
}
