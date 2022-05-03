part of '../login_page.dart';

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
        ],
      ),
    );
  }
}
