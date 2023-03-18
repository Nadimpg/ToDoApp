import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseweb/Auth/sing_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  resetpass(email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forgot Your \nPassword',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text('Enter your email and reset password',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              )),
          TextFormField(
            controller: _emailcontroller,
            obscureText: false,
            decoration: InputDecoration(
                hintText: 'email@gmail',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.greenAccent,
                )),
          ),
          Divider(
            color: Colors.transparent,
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
                onPressed: () => resetpass(_emailcontroller.text, context),
                child: Text('Reset Password')),
          )
        ],
      ),
    )));
  }
}
