import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet/app/core/ui/icons/my_icons.dart';
import 'package:flutter_cuidapet/app/core/widgets/cuidapet_logo.dart';
import 'package:flutter_cuidapet/app/core/widgets/custom_textform_field.dart';
import 'package:flutter_cuidapet/app/core/widgets/default_button.dart';
import 'package:flutter_cuidapet/app/core/widgets/rounded_button_social.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/login_form.dart';
part 'widgets/login_button_register.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CuidaPetLogo(),
              const SizedBox(
                height: 30,
              ),
              const _LoginForm(),
              const SizedBox(
                height: 40,
              ),
              _separatorOR(),
              const SizedBox(
                height: 40,
              ),
              const _LoginButtonRegister(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _separatorOR() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OU',
            style: TextStyle(fontSize: 15.sp),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
