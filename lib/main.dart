import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/app_module.dart';
import 'package:flutter_cuidapet/app/app_widget.dart';
import 'package:flutter_cuidapet/app/core/ui/application_config.dart';
import 'package:flutter_modular/flutter_modular.dart';

Future<void> main() async {
  ApplicationConfig().configureApp();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
