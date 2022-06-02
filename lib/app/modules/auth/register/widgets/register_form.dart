part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState
    extends ModularState<_RegisterForm, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _loginEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  void dispose() {
    _loginEC.dispose();
    _senhaEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Login',
            controller: _loginEC,
            obscureText: false,
            validator: Validatorless.multiple([
              Validatorless.required('Login Obrigatório!'),
              Validatorless.email('Login Deverá Ser Um Email Válido'),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _senhaEC,
            hint: 'Senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Senha Obrigatória!'),
              Validatorless.email('Senha Deve Ter Pelo Menos 6 Caracteres'),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            hint: 'Confirma Senha',
            obscureText: true,
            validator: Validatorless.multiple([
              Validatorless.required('Confirma Senha Obrigatório!'),
              Validatorless.email('Senha Deve Ter Pelo Menos 6 Caracteres'),
              Validatorless.compare(
                  _senhaEC, 'Senhas Não Coincidem! Tente Novamente!')
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButton(
            label: 'Cadastrar',
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;
              if (formValid) {
                controller.register(login: _loginEC.text, senha: _senhaEC.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
