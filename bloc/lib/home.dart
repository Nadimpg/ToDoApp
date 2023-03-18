import 'dart:js_util';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              CustomTextField(_emailcontroller, TextInputType.emailAddress,
                  'email@gmail', 'Email', Icon(Icons.account_circle)),
              Divider(
                height: 20,
              ),
              CustomTextField(_passcontroller, TextInputType.text, 'Password',
                  'pass', Icon(Icons.password)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget CustomTextField(controller, kbt, hint, label, icon) {
  return TextField(
    controller: controller,
    keyboardType: kbt,
    obscureText: true,
    decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: icon,
        iconColor: Colors.amber),
  );
}
