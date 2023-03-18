import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/counter.dart';

class Another extends StatelessWidget {
  const Another({super.key});

  @override
  Widget build(BuildContext context) {
    final Counters = Provider.of<Counter>(context);
    return Scaffold(
      body: Center(child: Text(Counters.count.toString())),
    );
  }
}
