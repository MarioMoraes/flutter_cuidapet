import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet/app/core/ui/icons/my_icons.dart';
import 'package:flutter_cuidapet/app/core/widgets/custom_textform_field.dart';
import 'package:flutter_cuidapet/app/core/widgets/default_button.dart';
import 'package:flutter_cuidapet/app/core/widgets/rounded_button_social.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormField(
                hint: 'Login',
                controller: _emailEC,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatorio';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomTextFormField(
                hint: 'Senha',
                obscure: true,
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultButton(
                label: 'Entrar',
                height: 40,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: context.primaryColorDark,
                      content: const Text('Click!'),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: [
                  RoundedButtonSocial(
                    onTap: () {},
                    icon: MyIcons.facebook,
                    title: 'Facebook',
                    color: Colors.blue,
                    width: 150.w,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButtonSocial(
                    onTap: () {},
                    icon: MyIcons.google,
                    title: 'Google',
                    color: Colors.red.shade500,
                    width: 150.w,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButtonSocial(
                    onTap: () {},
                    icon: MyIcons.envelope,
                    title: 'Email',
                    color: Colors.purple,
                    width: 150.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}