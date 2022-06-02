part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
          CustomTextFormField(
            controller: _senhaEC,
            hint: 'Senha',
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButton(
            label: 'Entrar',
            onPressed: () {
              Loader.show();
              Future.delayed(const Duration(seconds: 3), () => Loader.hide());
            },
          ),
        ],
      ),
    );
  }
}
