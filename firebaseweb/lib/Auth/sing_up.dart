import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseweb/Auth/sing_in.dart';
import 'package:firebaseweb/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sing_up extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  singup(email, pass, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      var authCredential = credential.user;
      if (authCredential!.uid.isNotEmpty) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
              'Thanks for installing this application!',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'create your account and start your journey with us.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 50,
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
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                  onPressed: () => singup(
                      _emailcontroller.text, _passcontroller.text, context),
                  child: Text('Sing Up')),
            ),
            Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      )),
    );
  }
}
