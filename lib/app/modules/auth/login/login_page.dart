import 'package:flutter/material.dart';
import 'package:flutter_cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter_cuidapet/app/core/ui/icons/my_icons.dart';
import 'package:flutter_cuidapet/app/core/widgets/cuidapet_logo.dart';
import 'package:flutter_cuidapet/app/core/widgets/custom_textform_field.dart';
import 'package:flutter_cuidapet/app/core/widgets/default_button.dart';
import 'package:flutter_cuidapet/app/core/widgets/rounded_button_social.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'widgets/login_form.dart';
part 'widgets/login_button_register.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CuidaPetLogo(),
                const SizedBox(
                  height: 30,
                ),
                const _LoginForm(),
                const SizedBox(
                  height: 20,
                ),
                _separatorOR(),
                const SizedBox(
                  height: 20,
                ),
                const _LoginButtonRegister(),
              ],
            ),
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
