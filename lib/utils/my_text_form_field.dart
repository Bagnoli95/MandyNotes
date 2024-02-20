import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class myTextFormField extends StatelessWidget {
  const myTextFormField({
    super.key,
    required this.formControler,
    required this.pathIcon,
  });

  final TextEditingController formControler;
  final String pathIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: formControler,
      decoration: InputDecoration(
          prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SvgPicture.asset(pathIcon),
      )),
    );
  }
}
