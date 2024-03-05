import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/home/home_main.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form_field.dart';
import 'package:mandy_notes/utils/text_inline.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Correo electrónico',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              myButton(
                  texto: 'Iniciar sesión',
                  accion: () {
                    print('LOGIN LOGIC!');
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomeScreen(), maintainState: true), (Route<dynamic> route) => false);
                  }),
              SizedBox(height: 20.0),
              HorizontalOrLine(label: 'or', height: 10)
            ],
          ),
        ),
      ),
    );
  }
}
