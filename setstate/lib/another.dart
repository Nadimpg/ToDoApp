import 'package:flutter/material.dart';

class Another extends StatelessWidget {
  int? _counter;
  Another(this._counter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _counter.toString(),
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
