import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/pages/auth/register_page_2.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form.dart';

class MyRegisterPage extends StatelessWidget {
  MyRegisterPage({super.key});

  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidoController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _correoController = TextEditingController();

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
                formControler: _nombreController,
                formIcon: Icon(Icons.edit),
                hintText: "Nombre",
                oscureText: false,
              ),
              SizedBox(height: 15.0),

              //Apellido
              myTextForm(
                formControler: _apellidoController,
                formIcon: Icon(Icons.edit),
                hintText: "Apellido",
                oscureText: false,
              ),
              SizedBox(height: 15.0),

              //nombre de usuario
              myTextForm(
                formControler: _usuarioController,
                formIcon: Icon(Icons.edit),
                hintText: "Usuario",
                oscureText: false,
              ),
              SizedBox(height: 15.0),

              //Correo
              myTextForm(
                formControler: _correoController,
                formIcon: Icon(Icons.edit),
                hintText: "Correo",
                oscureText: false,
              ),
              SizedBox(height: 20.0),

              //boton sgte. (pantalla sgte. contraseña)
              myButton(
                  texto: 'Siguiente',
                  accion: () {
                    print('LOGIN LOGIC!');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegisterPage2(), maintainState: true));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
