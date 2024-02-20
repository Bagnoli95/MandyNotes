import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final String texto;
  final Function accion;

  myButton({
    super.key,
    required this.texto,
    required this.accion,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        accion();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink.shade200,
        minimumSize: Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      icon: Icon(
        CupertinoIcons.add,
        color: Colors.white70,
        size: 20,
      ),
      label: Text(texto,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
