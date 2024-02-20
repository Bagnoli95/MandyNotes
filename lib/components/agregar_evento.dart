import 'package:flutter/material.dart';
import 'package:mandy_notes/utils/my_button.dart';
import 'package:mandy_notes/utils/my_text_form_field.dart';

class agregarFormulario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 620,
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.pink.shade100.withOpacity(0.94),
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              //titulo
              Text(
                "Crear evento",
                style: TextStyle(fontSize: 34, fontFamily: "Poppins"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Aqui puedes agregar los datos para un nuevo evento fantástico",
                  textAlign: TextAlign.center,
                ),
              ),
              NewEventForm()
            ],
          ),
        ),
      ),
    );
  }
}

class NewEventForm extends StatelessWidget {
  const NewEventForm({
    super.key,
  });

  loguear() {
    print("Ejecutandose desde el caller");
  }

  @override
  Widget build(BuildContext context) {
    final tituloControler = TextEditingController();
    final fechaControler = TextEditingController();

    String eventoDato = '';

    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TITULO
        Text("Nombre", style: TextStyle(color: Colors.black54)),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: myTextFormField(formControler: tituloControler, pathIcon: "assets/iconos/lapiz.svg"),
        ),

        //FECHA
        Text("Fecha", style: TextStyle(color: Colors.black54)),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 16),
          child: myTextFormField(formControler: fechaControler, pathIcon: "assets/iconos/calendario.svg"),
        ),

        //BOTON
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: myButton(
              texto: "Agregar",
              accion: () => {
                    loguear(),
                    eventoDato = 'POPUP CERRADO - ' + tituloControler.text,
                    Navigator.pop(context, eventoDato),
                  }),
        )
      ],
    ));
  }
}
