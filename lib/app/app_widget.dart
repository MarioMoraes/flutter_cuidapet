import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CuidaPet',
        builder: asuka.builder,
        navigatorObservers: [
          asuka.asukaHeroController,
        ],
        initialRoute: '/auth',
      ).modular(),
    );
  }
}