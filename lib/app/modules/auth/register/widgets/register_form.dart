part of '../register_page.dart';

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailEC = TextEditingController();
  final _senhaEC = TextEditingController();
  final _confirmaEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _senhaEC.dispose();
    _confirmaEC.dispose();
  }

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
            obscure: true,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: _confirmaEC,
            hint: 'Confirma Senha',
            obscure: true,
          ),
          const SizedBox(
            height: 20,
          ),
          DefaultButton(
            label: 'Cadastrar',
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
