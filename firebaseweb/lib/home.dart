import 'package:firebaseweb/Auth/sing_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nadim Hasan'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Sing_in()));
              },
              child: Text('Go to Sing_in Page')),
        ));
  }
}
