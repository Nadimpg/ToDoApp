import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/another.dart';
import 'package:providers/counter.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Counters = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Nadim Hasan'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => Another()));
              },
              icon: Icon(Icons.add_circle))
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () => Counters.CountData()),
      body: Center(
          child: Text(
        Counters.count.toString(),
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
