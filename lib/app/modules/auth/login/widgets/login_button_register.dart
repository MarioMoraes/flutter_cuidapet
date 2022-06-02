part of '../login_page.dart';

class _LoginButtonRegister extends StatefulWidget {
  const _LoginButtonRegister({Key? key}) : super(key: key);

  @override
  _LoginButtonRegisterState createState() => _LoginButtonRegisterState();
}

class _LoginButtonRegisterState extends State<_LoginButtonRegister> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        RoundedButtonSocial(
          onTap: () {
            Messages.alert('Alert Message');
          },
          icon: MyIcons.facebook,
          title: 'Facebook',
          color: Colors.blue,
          width: 160.w,
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedButtonSocial(
          onTap: () {
            Messages.info('Info Message');
          },
          icon: MyIcons.google,
          title: 'Google',
          color: Colors.red.shade500,
          width: 160.w,
        ),
        const SizedBox(
          height: 20,
        ),
        RoundedButtonSocial(
          onTap: () {
            Modular.to.pushNamed('/auth/register');
          },
          icon: MyIcons.envelope,
          title: 'Cadastro',
          color: context.primaryColorDark,
          width: 160.w,
        ),
      ],
    );
  }
}
