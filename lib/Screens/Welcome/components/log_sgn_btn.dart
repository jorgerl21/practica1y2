import 'package:flutter/material.dart';
import 'package:tecbook/Screens/Login/login_screen.dart';
import 'package:tecbook/Screens/Signup/signup_screen.dart';
import 'package:tecbook/Screens/User_Preferences/user_preference.dart';
import 'package:tecbook/constants.dart';

class LoginSignupBtn extends StatelessWidget {
  const LoginSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
            child: Text(
              "Iniciar sesion".toUpperCase(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: Text(
            "Registrarse".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return UserPreferenceScreen();
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
              primary: btnPreferencesColor, elevation: 0),
          child: Text(
            "Preferencias de usuario".toUpperCase(),
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
