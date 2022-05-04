import 'package:flutter_cuidapet/app/modules/auth/home/auth_home_page.dart';
import 'package:flutter_cuidapet/app/modules/auth/login/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'register/register_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => AuthHomePage(
        authStore: Modular.get(),
      ),
    ),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
  ];
}
