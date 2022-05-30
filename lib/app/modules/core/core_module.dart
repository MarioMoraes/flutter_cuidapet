import 'package:flutter_cuidapet/app/core/local_storage/local_storage.dart';
import 'package:flutter_cuidapet/app/core/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:flutter_cuidapet/app/core/logger/app_logger_impl.dart';
import 'package:flutter_cuidapet/app/core/rest_client/dio/dio_rest_client.dart';
import 'package:flutter_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:flutter_cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.lazySingleton<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<AppLogger>((i) => AppLoggerImpl(), export: true),
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorageImpl(),
        export: true),
  ];
}
