import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form.dart';

class MyRegisterPage2 extends StatelessWidget {
  MyRegisterPage2({super.key});

  TextEditingController _passController = TextEditingController();
  TextEditingController _pass2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40.0),
              //Icono
              Container(child: Icon(Icons.android, color: Colors.pink[200], size: 250)),

              //Nombre
              myTextForm(
                formControler: _passController,
                formIcon: Icon(Icons.edit),
                hintText: "Contraseña",
                oscureText: true,
              ),
              SizedBox(height: 15.0),

              //Apellido
              myTextForm(
                formControler: _pass2Controller,
                formIcon: Icon(Icons.edit),
                hintText: "Confirmar contraseña",
                oscureText: true,
              ),
              SizedBox(height: 20.0),

              //boton sgte. (pantalla sgte. contraseña)
              myButton(
                  texto: 'Confirmar',
                  accion: () {
                    print('LOGIN LOGIC!');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyLoginPage(), maintainState: true));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
