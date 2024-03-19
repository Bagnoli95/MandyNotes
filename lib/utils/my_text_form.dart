import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class myTextForm extends StatelessWidget {
  const myTextForm({
    super.key,
    required this.formControler,
    required this.formIcon,
    required this.oscureText,
    required this.hintText,
  });

  final TextEditingController formControler;
  final Icon formIcon;
  final bool oscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink[100]?.withOpacity(0.2),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: formControler,
        obscureText: oscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: formIcon,
        ),
      ),
    );
  }
}
