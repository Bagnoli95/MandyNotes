import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mandy_notes/class/constants.dart';
import 'package:mandy_notes/pages/auth/register_page.dart';
import 'package:mandy_notes/pages/home/home_main.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form.dart';
import 'package:mandy_notes/utils/text_inline.dart';

import 'package:http/http.dart' as http;

class MyLoginPage extends StatefulWidget {
  MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    // CONSUMIR WS PARA VALIDAR EL LOGIN
    final String apiUrl = AuthWS.baseUrl + AuthWS.login;
    final String requestBody = jsonEncode({"username": _emailController.text, "password": _passController.text});

    print("PETICION A: " + apiUrl.toString());
    print("REQUEST: " + requestBody);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      // WS RESPONDIO BIEN. Hay que validar la respuesta
      print(responseData['codReturn']);
      print(responseData['txtReturn']);
      print(responseData['token']);

      if (responseData['codReturn'] == '0') {
        print('EXITO!');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['token']),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(responseData['txtReturn']),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      // HUBO UN PROBLEMA CON LA RESPUESTA DEL SERVIDOR. Hay que mostrar un mensaje de error.
      print('Hubo un problema al hacer el login');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Hubo un problema al conectarnos con nuestros servidores. Favor intente nuevamente más tarde.'),
        backgroundColor: Colors.red,
      ));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
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
                      formControler: _emailController,
                      formIcon: Icon(Icons.email),
                      hintText: "Correo",
                      oscureText: false,
                    ),

                    SizedBox(height: 20.0),

                    // Pass input
                    myTextForm(
                      formControler: _passController,
                      formIcon: Icon(Icons.lock),
                      hintText: "Contraseña",
                      oscureText: true,
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    myButton(
                      texto: 'Iniciar sesión',
                      accion: _login,
                      // accion: () {
                      //   _login;
                      //   // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MyHomeScreen(), maintainState: true), (Route<dynamic> route) => false);
                      // },
                    ),
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

                    SizedBox(height: 80.0),
                    HorizontalOrLine(label: 'or', height: 10)
                  ],
                ),
              ),
            ),
            _isLoading
                ? Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
