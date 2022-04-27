import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/screen_util_extension.dart';

class AuthHomePage extends StatefulWidget {
  const AuthHomePage({Key? key}) : super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 162.w,
        height: 130.h,
        fit: BoxFit.contain,
      ),
    );
  }
}
