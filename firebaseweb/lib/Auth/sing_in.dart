import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseweb/Auth/reset.dart';
import 'package:firebaseweb/Auth/sing_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class Sing_in extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  singIn(email, pass, context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            Text('Login to your Screen and Start Using \nthis app',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                )),
            SizedBox(
              height: 40,
            ),
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
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passcontroller,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'password',
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.padding_outlined,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(text: 'Don\'t have an account?', children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(context,
                            CupertinoPageRoute(builder: (_) => Reset())),
                      text: 'Reset Now',
                      style: TextStyle(color: Colors.red))
                ]),
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () => singIn(
                      _emailcontroller.text, _passcontroller.text, context),
                  child: Text('Sing In')),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Text.rich(TextSpan(text: 'Don\'t have an account?', children: [
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.push(
                        context, CupertinoPageRoute(builder: (_) => Sing_up())),
                  text: 'Create account',
                  style: TextStyle(color: Colors.amber))
            ]))
          ],
        ),
      )),
    );
  }
}
