import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/utils/my_button.dart';

class MyAccountUser extends StatefulWidget {
  const MyAccountUser({super.key});

  @override
  State<MyAccountUser> createState() => _MyAccountUserState();
}

class _MyAccountUserState extends State<MyAccountUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('AccountPage'),
        ),
        myButton(
            texto: 'Cerrar sesión',
            accion: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyLoginPage(), maintainState: true), (Route<dynamic> route) => false);
            }),
      ],
    );
  }
}
