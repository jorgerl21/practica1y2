import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tecbook/Screens/Login/login_screen.dart';
import 'package:tecbook/components/account_check.dart';
import 'package:tecbook/constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late XFile? _imageFile = null;

  // validar correo
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa un correo electrónico.';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Ingresa un correo electrónico válido.';
    }
    return null;
  }

  // validar nombre
  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu nombre.';
    }
    final numRegex = RegExp(r'^[A-Za-z\s]+$');
    if (!numRegex.hasMatch(value)) {
      return 'Ingresa un nombre valido.';
    }
    return null;
  }

  // validar apellidos
  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tus apellidos.';
    }
    final numRegex = RegExp(r'^[A-Za-z\s]+$');
    if (!numRegex.hasMatch(value)) {
      return 'Ingresa apellidos validos.';
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

  void _selectImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (_imageFile != null)
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(_imageFile!.path)),
                  ),
                if (_imageFile == null)
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    child: Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    height: 35,
                    width: 35,
                    child: ElevatedButton(
                      onPressed: _selectImage,
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.zero,
                        primary: kPrimaryColor,
                        elevation: 5,
                      ),
                      child: Icon(Icons.camera_alt, size: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (firstname) {},
            controller: _firstNameController,
            validator: _validateFirstName,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Ingresa tu nombre",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: kPrimaryColor,
              hoverColor: kPrimaryLightColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSaved: (lastname) {},
            controller: _lastNameController,
            validator: _validateLastName,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Ingresa tus apellidos",
              hintStyle: TextStyle(color: Colors.white),
              fillColor: kPrimaryColor,
              hoverColor: kPrimaryLightColor,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(
                  Icons.account_box,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
            child: Text("Registrate".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          CheckAccount(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
