import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cuidapet/app/core/helpers/environments.dart';

class ApplicationConfig {
  Future<void> configureApp() async {
    await _initializeFirebase();
    await _loadEnvs();
  }

  _initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  Future<void> _loadEnvs() => Environments.loadEnvs();
}
