import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet/app/core/widgets/cuidapet_logo.dart';
import 'package:flutter_cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/widgets/custom_textform_field.dart';
import '../../../core/widgets/default_button.dart';

part 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 80 - kToolbarHeight,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: const [
              CuidaPetLogo(),
              SizedBox(
                height: 30,
              ),
              _RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
