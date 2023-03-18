import 'package:flutter/material.dart';
import 'package:myapp/secondscreen.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Chat'))),
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Second-screen');
                },
                child: Text('Go'))
          ],
        ),
      ),
    );
  }
}
