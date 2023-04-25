import 'package:flutter/material.dart';
import 'package:tecbook/Screens/Login/components/social_login.dart';
import 'package:tecbook/Screens/Signup/signup_screen.dart';
import 'package:tecbook/components/account_check.dart';
import 'package:tecbook/constants.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    // validar correo
    String? _validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Ingresa tu correo electrónico.';
      }
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Ingresa un correo electrónico válido.';
      }
      return null;
    }

    // validar password
    String? _validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Ingresa una contraseña.';
      }
      return null;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onSaved: (email) {},
            controller: _emailController,
            validator: _validateEmail,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Ingresa un correo electronico",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: kPrimaryColor,
              hoverColor: kPrimaryLightColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              textInputAction: TextInputAction.next,
              onSaved: (password) {},
              controller: _passwordController,
              validator: _validatePassword,
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Ingresa una contraseña",
                hintStyle: TextStyle(color: Colors.white),
                fillColor: kPrimaryColor,
                hoverColor: kPrimaryLightColor,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Si el formulario es válido, continuar con el envío
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(kPrimaryLightColor),
            ),
            child: Text("Iniciar sesion".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          CheckAccount(
            login: true,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
          SocalSignUp(),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
