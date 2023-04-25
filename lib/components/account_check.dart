import 'package:flutter/material.dart';
import 'package:tecbook/constants.dart';

class CheckAccount extends StatelessWidget {
  final bool login;
  final Function? press;
  const CheckAccount({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? "¿Aun no tienes una cuenta? "
              : "¿Ya dispones de una cuenta? ",
          style: const TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            login ? "Registrate" : "Inicia sesion",
            style: const TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
