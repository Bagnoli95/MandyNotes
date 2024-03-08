import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/register_page.dart';
import 'package:mandy_notes/pages/home/home_main.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form.dart';
import 'package:mandy_notes/utils/text_inline.dart';

class MyLoginPage extends StatelessWidget {
  MyLoginPage({super.key});

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40.0),
                //Icono
                Container(child: Icon(Icons.android, color: Colors.pink[200], size: 250)),

                // Email input
                myTextForm(
                  formControler: _emailControler,
                  formIcon: Icon(Icons.email),
                  hintText: "Correo",
                  oscureText: false,
                ),

                SizedBox(height: 20.0),

                // Pass input
                myTextForm(
                  formControler: _passControler,
                  formIcon: Icon(Icons.lock),
                  hintText: "Contraseña",
                  oscureText: true,
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

                //REGISTRO
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Aún no tienes una cuenta?'),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () => {print("hola"), Navigator.push(context, MaterialPageRoute(builder: (context) => MyRegisterPage(), maintainState: true))},
                      child: Text(
                        'Registrate.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),
                HorizontalOrLine(label: 'or', height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
