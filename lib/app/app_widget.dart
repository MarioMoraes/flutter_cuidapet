import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_cuidapet/app/core/ui/ui_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/auth');

    Modular.setObservers([
      asuka.asukaHeroController,
    ]);

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_) => MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
        title: UiConfig.title,
        theme: UiConfig.theme,
        builder: (context, child) {
          ScreenUtil.setContext(context);
          return asuka.builder(context, child);
        },
      ),
    );
  }
}
