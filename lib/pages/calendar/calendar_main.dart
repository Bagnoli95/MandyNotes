import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:mandy_notes/class/eventos.dart';
import 'package:mandy_notes/components/agregar_evento.dart';
import 'package:mandy_notes/utils/my_button_small.dart';

class HeatMapCalendarExample extends StatefulWidget {
  const HeatMapCalendarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeatMapCalendarExample();
}

class _HeatMapCalendarExample extends State<HeatMapCalendarExample> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController heatLevelController = TextEditingController();

  bool isOpacityMode = true;
  late Data eventoDevuelto;

  Map<DateTime, int> heatMapDatasets = {};

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    heatLevelController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10),

            // HeatMapCalendar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeatMapCalendar(
                  flexible: true,
                  datasets: heatMapDatasets,
                  colorMode: isOpacityMode ? ColorMode.opacity : ColorMode.color,
                  colorsets: const {
                    1: Colors.red,
                    3: Colors.orange,
                    5: Colors.yellow,
                    7: Colors.green,
                    9: Colors.blue,
                    11: Colors.indigo,
                    13: Colors.purple,
                  },
                ),
                myButtonSmall(
                  texto: "Agregar",
                  accion: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return agregarFormulario();
                      },
                    ).then((textoDevuelto) {
                      // Maneja el texto devuelto aquí
                      if (textoDevuelto != null && textoDevuelto.isNotEmpty) {
                        print('Texto ingresado: $textoDevuelto');
                        // setState(() {
                        //   heatMapDatasets[DateTime.parse(dateController.text)] = int.parse(heatLevelController.text);
                        // });
                      } else {
                        print('No se ingresó ningún texto.');
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),

        // ColorMode/OpacityMode Switch.
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Color Mode'),
            CupertinoSwitch(
              value: isOpacityMode,
              onChanged: (value) {
                setState(() {
                  isOpacityMode = value;
                });
              },
            ),
            const Text('Opacity Mode'),
          ],
        ),

        //ListView
        ListTile(
          title: Text('Hola'),
        ),
      ],
    );
  }
}
